FactoryBot.define do
    sequence(:name) { |n| "#{n}" }

    factory :product, class: 'Product' do
      name {'bike'}
      price { 540.0 }
      description { "Awesome Bike" }
    end

  end
