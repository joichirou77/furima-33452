require 'rails_helper'

RSpec.describe OrderingParty, type: :model do
  before do
    @ordering_party= FactoryBot.build(:ordering_party)
  end

  context '商品購入ができる' do
    it '全ての情報を入れると購入できる' do
      expect(@ordering_party).to be_valid
    end
  end

  context '商品購入ができない' do
    it 'tokenが空だと購入できない' do
      @ordering_party.token = ""
      @ordering_party.valid?
      expect(@ordering_party.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと購入できない' do
      @ordering_party.post_code = ""
      @ordering_party.valid?
      expect(@ordering_party.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号い-がないと購入できない' do
      @ordering_party.post_code = "111111"
      @ordering_party.valid?
      expect(@ordering_party.errors.full_messages).to include("Post code input correctly")
    end
    it '都道府県がないと購入できない' do
      @ordering_party.prefecture_id = ""
      @ordering_party.valid?
      expect(@ordering_party.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '都道府県が---だと購入できない' do
      @ordering_party.prefecture_id = 1
      @ordering_party.valid?
      expect(@ordering_party.errors.full_messages).to include("Prefecture select")
    end
    it '市区町村が空だと購入できない' do
      @ordering_party.city = ""
      @ordering_party.valid?
      expect(@ordering_party.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと購入できない' do
      @ordering_party.house_number = ""
      @ordering_party.valid?
      expect(@ordering_party.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号に空だと購入できない' do
      @ordering_party.phone_number = ""
      @ordering_party.valid?
      expect(@ordering_party.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号に-があれば購入できない' do
      @ordering_party.phone_number = "080-1111-1111"
      @ordering_party.valid?
      expect(@ordering_party.errors.full_messages).to include("Phone number input only number")
    end
  end
  
end
