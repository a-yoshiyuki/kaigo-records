require 'rails_helper'

RSpec.describe "Admin::HomesController", type: :request do
  let(:admin) { FactoryBot.create(:admin) }
  before do
    sign_in admin
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
end