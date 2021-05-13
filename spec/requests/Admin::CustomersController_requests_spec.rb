require 'rails_helper'

RSpec.describe "Admin::CustomersController", type: :request do
  let(:admin) { FactoryBot.create(:admin) }
  before do
    sign_in admin
  end

  describe 'トップ画面' do
    context "トップ画面が正しく表示される" do
      before do
        get root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '管理者ホーム画面' do
    context "管理者ホーム画面が正しく表示される" do
      before do
        get admin_root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
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

  describe '非ログイン時'
    context "利用者一覧ページが正しく表示されない" do
      before do
        get admin_customers_path
      end
      it 'リクエストは400 OKとなること' do
        expect(response.status).to eq 401
      end
    end
  end
