class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :prefecture
  belongs_to :preparation_day
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  # プルダウン選択漏れNG
  with_options numericality: { other_than: 1, message: 'select' } do
    validates :category_id # カテゴリー
    validates :condition_id # 商品状態
    validates :postage_payer_id # 配送負担
    validates :prefecture_id # 配送元
    validates :preparation_day_id # 配送日数
  end

  # 半角数字のみOK
  validates :price, format: { with: /\A[0-9]+\z/, message: 'half-width numbers' }

  # 入力金額$300~$9,999,999ならOK
  validates :price, Inclusion: { in: 300..9_999_999, message: 'outside the limits' }

end
