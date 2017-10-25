require 'rails_helper'

RSpec.describe User, type: :model do
    describe "creation" do
        before do
            @user = User.create(email: "test@test.com", 
                                password: "foobar", 
                                password_confirmation: "foobar")
        end

        it "can be created" do
            expect(@user).to be_valid
        end
    end
end
