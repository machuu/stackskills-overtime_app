require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: "user")
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it "can be reached" do
      expect(page.status_code).to eq(200)
    end

    it "has a title of posts" do
      expect(page).to have_content(/Posts/)
    end

    it "has a list of posts" do
      post1 = FactoryBot.create(:post)
      post2 = FactoryBot.create(:second_post)

      visit posts_path

      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'creation' do
    before do
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

  describe 'edit' do
    it 'can be reached by clicking edit on index page' do
      post = FactoryBot.create(:post)
      visit posts_path

      click_link "edit_#{post.id}"
      expect(page.status_code).to eq(200)
    end
  end
end