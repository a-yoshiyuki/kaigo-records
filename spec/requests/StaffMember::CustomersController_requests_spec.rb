require 'rails_helper'

RSpec.describe "StaffMember::CustomersController", type: :request do
  let(:staff_member) { FactoryBot.create(:staff_member) }
  let(:customer) { FactoryBot.create(:customer) }
  before do
    sign_in staff_member
  end

  describe '利用者一覧ページ' do
    context "利用者一覧ページが正しく表示される" do
      before do
        get staff_member_root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '個人記録ページ' do
    context "個人記録ページが正しく表示される" do
      before do
        get staff_member_customer_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end
