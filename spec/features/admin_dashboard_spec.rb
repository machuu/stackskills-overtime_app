require 'rails_helper'

describe 'admin dashboard' do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:admin_user) }

  it 'does not allow users to access without being signed in' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'can not be reached by a non admin user' do
    login_as(user, scope: :user)

    visit admin_root_path

    expect(current_path).to eq(root_path)
  end

  it 'can be reached by an admin user' do
    login_as(admin_user, scope: :user)

    visit admin_root_path

    expect(current_path).to eq(admin_root_path)
  end
end