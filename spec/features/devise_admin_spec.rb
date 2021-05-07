require 'rails_helper'

RSpec.describe 'admin側　ログイン', type: :feature do
  before do
    Admin.create!(email: 'foo@example.com', password: '123456')
  end
  context "ログインテスト" do
    it 'ログイン実行' do
      visit new_admin_session_path
      fill_in 'admin[email]', with: 'foo@example.com'
      fill_in 'admin[password]', with: '123456'
      click_on 'ログイン'
      expect(page).to have_content '利用者一覧'
    end
  end
end