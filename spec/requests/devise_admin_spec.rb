require 'rails_helper'

RSpec.describe "admin_devise_sign_in", type: :request do
  let(:admin) {create(:admin)}
  let(:admin_params) { attributes_for(:admin) }
  let(:invalid_admin_params) { attributes_for(:admin, name: "") }

  describe 'admin ログイン' do
    context "ログイン画面が正しく表示される" do
      before do
        get new_admin_session_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
    
    

    context "新規登録画面が正しく表示される" do
      before do
        get new_admin_registration_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end


  describe 'POST #create' do
    before do
      ActionMailer::Base.deliveries.clear
    end
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post admin_registration_path, params: { admin: admin_params }
        expect(response.status).to eq 302
      end
    end

    it 'createが成功すること' do
      expect do
        post admin_registration_path, params: { admin: admin_params }
      end.to change(Admin, :count).by 1
    end
  end
end
