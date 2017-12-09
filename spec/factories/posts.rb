FactoryBot.define do
  factory :post do
    date Date.today
    rationale "Post1 Rationale Content"
    overtime_request 3.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Post2 Rationale Content"
    overtime_request 0.75
    user
  end

  factory :third_post, class: "Post" do
    date Date.yesterday
    rationale "Post3 Rationale Content"
    overtime_request 2.0
    user
  end
end