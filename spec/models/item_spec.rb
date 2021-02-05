require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  context '商品出品できる' do
    it '全ての情報を入れると出品できる' do
      expect(@item).to be_valid
    end
  end

  context '商品が出品できない' do
    it '商品名が空だと登録できない' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空だと登録できない' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーが空だと登録できない' do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category select")
    end

    it 'カテゴリーが---だと登録できない' do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category select")
    end

    it '商品の状態が空だと登録できない' do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition select")
    end

    it '商品の状態が---どと登録できない' do
      @item.condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition select")
    end

    it '配送料の負担が空だと登録できない' do
      @item.postage_payer_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer select")
    end

    it '配送料の負担が---だと登録できない' do
      @item.postage_payer_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer select")
    end

    it '配送元が空だと登録できない' do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture select")
    end

    it '配送元が---だと登録できない' do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture select")
    end

    it '配送までの日数が空だと登録できない' do
      @item.preparation_day_id= ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation day select")
    end

    it '配送までの日数が---だと登録できない' do
      @item.preparation_day_id= "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation day select")
    end

    it '価格が空だと登録できない' do
      @item.price= ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が全角だと登録できない' do
      @item.price= "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price outside the limits")
    end

    it '価格が$300以下だと登録できない' do
      @item.price= "200"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price outside the limits")
    end

    it '価格が$9,999,999以上だと登録できない' do
      @item.price= "100000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price outside the limits")
    end

    it '画像が空だと登録できない' do
      @item.image= nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
