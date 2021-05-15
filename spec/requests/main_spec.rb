require 'rails_helper'

RSpec.describe 'admin側　ログイン', type: :feature do
  describe 'admin権限のテスト'  do
    let!(:admin) { FactoryBot.create(:admin) }
    let!(:customer) { FactoryBot.create(:customer) }
    describe 'ログインしていない場合' do
      context 'admin関連のURLにアクセス' do
        it 'topページが表示されない' do
          visit admin_root_path
          expect(current_path).to eq('/admins/sign_in')
        end
        it '利用者一覧ページが表示されない' do
          visit admin_customers_path
          expect(current_path).to eq('/admins/sign_in')
        end
        it '詳細ページが表示されない' do
          visit admin_customer_path(customer.id)
          expect(current_path).to eq('/admins/sign_in')
        end
        it '新規登録ページが表示されない' do
          visit new_admin_customer_path
          expect(current_path).to eq('/admins/sign_in')
        end
        it '過去の利用者検索ページが表示されない' do
          visit list_admin_customers_path
          expect(current_path).to eq('/admins/sign_in')
        end
        it '過去の経過記録ページが表示されない' do
          visit staff_member_progress_record_path(customer.id)
          expect(current_path).to eq('/')
        end
        it '過去のバイタル記録ページが表示されない' do
          visit staff_member_index_staff_member_vital_record_path(customer.id)
          expect(current_path).to eq('/')
        end
        it '過去の食事量・水分量記録ページが表示されない' do
          visit staff_member_index_staff_member_meal_record_path(customer.id)
          expect(current_path).to eq('/')
        end
      end

      context 'staff関連のURLにアクセス' do
        it 'スタッフ一覧ページが表示されない' do
          visit admin_staff_members_path
          expect(current_path).to eq('/admins/sign_in')
        end
        it 'スタッフアカウント作成ページが表示されない' do
          visit staff_member_progress_record_path(customer.id)
          expect(current_path).to eq('/')
        end
      end
    end
  end
end