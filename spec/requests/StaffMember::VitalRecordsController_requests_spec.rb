require 'rails_helper'

RSpec.describe "StaffMember::VitalRecordsController", type: :request do
  let!(:staff_member) { FactoryBot.create(:staff_member) }
  let!(:customer) { FactoryBot.create(:customer) }
  let!(:vital_record) { FactoryBot.create(:vital_record) }
  before do
    sign_in staff_member
  end

    context "過去のバイタル記録ページが正しく表示される" do
      before do
        get staff_member_index_staff_member_vital_record_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "バイタル記録一覧ページが正しく表示される" do
      before do
        get list_staff_member_vital_records_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "バイタル記録入力ページが正しく表示される" do
      before do
        get staff_member_new_vital_record_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "バイタル記録編集ページが正しく表示される" do
      before do
        get edit_staff_member_vital_record_path(vital_record.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
end
