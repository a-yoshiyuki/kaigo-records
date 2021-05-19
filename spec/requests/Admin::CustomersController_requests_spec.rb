require 'rails_helper'

RSpec.describe "Admin::CustomersController", type: :request do
  let(:admin) { FactoryBot.create(:admin) }
  let(:customer) { FactoryBot.create(:customer) }
  before do
    sign_in admin
  end

  describe '利用者一覧ページ' do
    context "利用者一覧ページが正しく表示される" do
      before do
        get admin_customers_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '利用者情報詳細ページ' do
    context "利用者情報詳細ページが正しく表示される" do
      before do
        get admin_customer_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '利用者情報編集ページ' do
    context "利用者情報編集ページが正しく表示される" do
      before do
        get edit_admin_customer_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '過去の経過記録ページ' do
    context "過去の経過記録ページが正しく表示される" do
      before do
        get staff_member_progress_record_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '過去のバイタル記録ページ' do
    context "過去のバイタル記録ページが正しく表示される" do
      before do
        get staff_member_index_staff_member_vital_record_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '過去の食事量・水分量記録ページ' do
    context "過去の食事量・水分量記録ページが正しく表示される" do
      before do
        get staff_member_index_staff_member_meal_record_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end
