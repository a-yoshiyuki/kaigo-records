require 'rails_helper'

RSpec.describe "StaffMember::MealRecordsController", type: :request do
  let!(:staff_member) { FactoryBot.create(:staff_member) }
  let!(:customer) { FactoryBot.create(:customer) }
  let!(:meal_record) { FactoryBot.create(:meal_record) }
  before do
    sign_in staff_member
  end

    context "過去の食事量・水分量記録ページが正しく表示される" do
      before do
        get staff_member_index_staff_member_meal_record_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "食事摂取記録一覧ページが正しく表示される" do
      before do
        get list_staff_member_meal_records_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end


    context "食事摂取記録入力ページが正しく表示される" do
      before do
        get staff_member_new_meal_record_path(customer.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "食事摂取記録編集ページが正しく表示される" do
      before do
        get edit_staff_member_meal_record_path(meal_record.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
end
