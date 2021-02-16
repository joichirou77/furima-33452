class OrdersController < ApplicationController
  before_action :item_user, only: [:index, :create]
  before_action :cheak_user, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]


  def index
    @ordering_party = OrderingParty.new
  end

  def create
    @ordering_party = OrderingParty.new(ordering_party_params)
    if @ordering_party.valid?
      pay_item
      @ordering_party.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def ordering_party_params
    params.require(:ordering_party).permit(:post_code, :prefecture_id, :city, :house_number,:building_name, :phone_number,:price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,   # 商品の値段
        card: ordering_party_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  
  def item_user
    @item = Item.find(params[:item_id])
  end

  def cheak_user
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
