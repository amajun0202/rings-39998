require 'rails_helper'

RSpec.describe Location, type: :model do
  before do
    @location = FactoryBot.build(:location)
  end

  describe 'location新規登録' do
  
    context '新規登録できる場合' do

      it '全ての項目が入力されていれば登録できる' do
        expect(@location).to be_valid
      end

    end
    
    context '新規登録できない場合' do
      
      it 'タイトルが空では登録できない' do
        @location.title = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Title can't be blank")
      end

      it '複数の画像が空では登録できない' do
        @location.images = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Images can't be blank")
      end

      it '所要時間が空では登録できない' do
        @location.estimated_time = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Estimated time can't be blank")
      end

      it '娯楽系　食事系の選択が空では登録できない' do
        @location.meal_enter_id = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Meal enter can't be blank")
      end

      it '娯楽系　食事系の選択が---では登録できない' do
        @location.meal_enter_id = '1'
        @location.valid?
        expect(@location.errors.full_messages).to include("Meal enter を選んでください")
      end

      it '必要な金額(最高)が空では登録できない' do
        @location.max_cost = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Max cost can't be blank")
      end

      it '必要な金額(最高)が英字では登録できない' do
        @location.max_cost = 'aaaa'
        @location.valid?
        expect(@location.errors.full_messages).to include("Max cost は半角数字のみです")
      end

      it '必要な金額(最高)が全角では登録できない' do
        @location.max_cost = 'ああああ'
        @location.valid?
        expect(@location.errors.full_messages).to include("Max cost は半角数字のみです")
      end

      it '必要な金額(最安)が空では登録できない' do
        @location.min_cost = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Min cost can't be blank")
      end

      it '必要な金額(最安)が英字では登録できない' do
        @location.min_cost = 'aaaa'
        @location.valid?
        expect(@location.errors.full_messages).to include("Min cost は半角数字のみです")
      end

      it '必要な金額(最安)が全角では登録できない' do
        @location.min_cost = 'ああああ'
        @location.valid?
        expect(@location.errors.full_messages).to include("Min cost は半角数字のみです")
      end

      it '説明が空では登録できない' do
        @location.description = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Description can't be blank")
      end
      
      it '住所が空では登録できない' do
        @location.address = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Address can't be blank")
      end

      it '重複した住所が存在する場合は登録できない' do
        @location.save
        another_location = FactoryBot.build(:location)
        another_location.address = @location.address
        another_location.valid?
        expect(another_location.errors.full_messages).to include('Address has already been taken')
      end

      it '電話番号が英字では登録できない' do
        @location.phone_number = 'aaaa'
        @location.valid?
        expect(@location.errors.full_messages).to include("Phone number は半角数字のみです")
      end

      it '電話番号が全角では登録できない' do
        @location.phone_number = 'ああああ'
        @location.valid?
        expect(@location.errors.full_messages).to include("Phone number は半角数字のみです")
      end

      it '電話番号が9桁以下では登録できない' do
        @location.phone_number = '999'
        @location.valid?
        expect(@location.errors.full_messages).to include("Phone number は正しいものをお願いします")
      end

      it '電話番号が12桁以上では登録できない' do
        @location.phone_number = '999999999999'
        @location.valid?
        expect(@location.errors.full_messages).to include("Phone number は正しいものをお願いします")
      end

      it '最寄り駅名に"駅"が入っている場合は登録できない' do
        @location.nearest_station = '綾瀬駅'
        @location.valid?
        expect(@location.errors.full_messages).to include("Nearest station には「駅」を含めないでください")
      end

      it '最寄り駅からの時間が英字では登録できない' do
        @location.travel_time = 'aaaa'
        @location.valid?
        expect(@location.errors.full_messages).to include("Travel time は半角数字のみです")
      end

      it '最寄り駅からの時間が全角では登録できない' do
        @location.travel_time = 'ああああ'
        @location.valid?
        expect(@location.errors.full_messages).to include("Travel time は半角数字のみです")
      end

      it '営業時間が空では登録できない' do
        @location.business_hours = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Business hours can't be blank")
      end

      it '公式サイトのリンクが正しいURLでないと登録できない' do
        @location.official_url = 'htp'
        @location.valid?
        expect(@location.errors.full_messages).to include("Official url は正しいURLの形式で入力してください")
      end

      it '予約の有無の選択が空では登録できない' do
        @location.requires_id = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Requires can't be blank")
      end

      it '予約の有無の選択が---では登録できない' do
        @location.requires_id = '1'
        @location.valid?
        expect(@location.errors.full_messages).to include("Requires を選んでください")
      end

    end

  end
end