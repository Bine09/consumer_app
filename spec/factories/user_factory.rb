

FactoryBot.define do   #Inside the block we just created, we define our first factory and all future factories in that file. (You should not have any factories outside of that block!):
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do          #Just keep in mind to add class: ... whenever you create a factory that doesn't have the same name as a model.
  # email "peter@example.com"
   email
   password "1234567890"
   first_name "Peter"
   last_name "Example"
   admin false
end

factory :admin, class: User do
  # email "peter2@example.com"
  email
  password "qwertyuiop"
  admin true
  first_name "Admin"
  last_name "User"
end

end
