require 'rails_helper'

RSpec.describe "staff_member_devise_sign_in", type: :request do
  let(:staff_member) {create(:staff_member)}
  let(:staff_member_params) { attributes_for(:staff_member) }
  let(:invalid_staff_member_params) { attributes_for(:staff_member, name: "") }

  describe 'GET #new' do
    context "ログイン画面が正しく表示される" do
      before do
        get new_staff_member_session_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "新規登録画面が正しく表示される" do
      before do
        get new_staff_member_registration_path
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
        post staff_member_registration_path, params: { staff_member: staff_member_params }
        expect(response.status).to eq 302
      end
    end

    it 'createが成功すること' do
      expect do
        post staff_member_registration_path, params: { staff_member: staff_member_params }
      end.to change(StaffMember, :count).by 1
    end
  end
end
