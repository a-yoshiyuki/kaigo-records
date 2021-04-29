require 'rails_helper'

RSpec.describe "Admin::CustomersController", type: :request do
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
end