FactoryBot.define do

  sequence :email do |n|
    "fake#{n}@example.com"
  end

  sequence :name do |n|
    "fake#{n}"
  end

end