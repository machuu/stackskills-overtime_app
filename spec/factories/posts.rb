FactoryBot.define do
  factory :post do
    date Date.today
    rationale "Post1 Rationale Content"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Post2 Rationale Content"
    user
  end
end