require 'rails_helper'

RSpec.describe "StaffMember::ProgressRecordsController", type: :request do
  let!(:staff_member) { FactoryBot.create(:staff_member) }
  let!(:customer) { FactoryBot.create(:customer) }
  let!(:progress_record) { FactoryBot.create(:progress_record) }
  before do
    sign_in staff_member
  end

  describe '経過記録関連' do
    context "経過記録ページが正しく表示される" do
      before do
        get staff_member_progress_record_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "過去の経過記録ページが正しく表示される" do
      before do
        get staff_member_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

        context "経過記録一覧ページが正しく表示される" do
      before do
        get list_staff_member_progress_records_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "個人の経過記録ページが正しく表示される" do
      before do
        get staff_member_progress_record_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "経過記録入力ページが正しく表示される" do
      before do
        get staff_member_new_staff_member_progress_record_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "経過記録編集ページが正しく表示される" do
      before do
        get edit_staff_member_progress_record_path(progress_record.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end
