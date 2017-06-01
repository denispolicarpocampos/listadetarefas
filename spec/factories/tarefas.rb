FactoryGirl.define do
  factory :tarefa do
   	titulo { Faker::Name.title }
    descricao { Faker::Name.title }
    data {Faker::Time.between(DateTime.now, DateTime.now + 365.days)}
    user
  end
end

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end
end