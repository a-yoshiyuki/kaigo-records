require 'rails_helper'

RSpec.describe "Admin::StaffMembersController", type: :request do
  let(:admin) { FactoryBot.create(:admin) }
  let(:staff_member) { FactoryBot.create(:staff_member) }
  before do
    sign_in admin
  end

  describe 'スタッフ一覧ページ' do
    context "スタッフ一覧ページが正しく表示される" do
      before do
        get admin_staff_members_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'スタッフアカウント作成ページ' do
    context "スタッフアカウント作成ページが正しく表示される" do
      before do
        get new_staff_member_registration_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'スタッフ情報詳細ページ' do
    context "スタッフ情報詳細ページが正しく表示される" do
      before do
        get admin_staff_member_path(staff_member.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'スタッフ情報編集ページ' do
    context "スタッフ情報編集ページが正しく表示される" do
      before do
        get edit_admin_staff_member_path(staff_member.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end