require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it "can be reached" do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it "has a title of posts" do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "test@test.com",
                          password: "foobar",
                          password_confirmation: "foobar",
                          first_name: "test",
                          last_name: "user")
      login_as(user, scope: user)
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'some rationale'

      click_on 'Save'

      expect(page).to have_content("some rationale")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'

      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end