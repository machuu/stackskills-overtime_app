require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:another_user) }
  let(:non_authorized_user) { FactoryBot.create(:non_authorized_user) }
  let(:admin_user) { FactoryBot.create(:admin_user) }

  before do
    login_as(user, scope: :user)
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

    it 'can only see current_user posts' do
      FactoryBot.create(:post, user: user)
      FactoryBot.create(:second_post, user: user)
      FactoryBot.create(:third_post, user: another_user)

      visit posts_path

      expect(page).to have_content(/Post1/)
      expect(page).to have_content(/Post2/)
      expect(page).to_not have_content(/Post3/)

    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path

      click_link 'new_post_from_nav'
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @post = FactoryBot.create(:post, user: user)
      visit posts_path
      click_link "delete_post_#{@post.id}_from_index"
      expect(page.status_code).to eq(200)
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
    before do
      @post = FactoryBot.create(:post, user: user)
    end

    it 'can be reached by clicking edit on index page' do
      visit posts_path

      click_link "edit_#{@post.id}"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited Content'

      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq("Edited Content")
    end

    it 'can not be edited by a non-authorized user' do
      logout(:user)
      login_as(non_authorized_user, scope: :user)

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end
  end
end
