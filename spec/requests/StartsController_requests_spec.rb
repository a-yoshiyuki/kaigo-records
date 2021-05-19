require 'rails_helper'

RSpec.describe "StartsController", type: :request do

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
end