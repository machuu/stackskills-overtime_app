@user = User.create(email: "test@test.com",
                   password: "foobar",
                   password_confirmation: "foobar",
                   first_name: "test",
                   last_name: "user")
puts "1 User Created"

@admin_user = AdminUser.create(email: "admin@test.com",
                   password: "foobar",
                   password_confirmation: "foobar",
                   first_name: "admin",
                   last_name: "user")
puts "1 Admin User Created"

100.times do |post|
  Post.create!(date: Date.today,
               rationale: "#{post} rationale content",
               user_id: @user.id)
end

puts "100 posts have been created"