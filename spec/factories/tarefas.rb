FactoryGirl.define do
  factory :tarefa do
    association :user
    titulo { Faker::Name.title }
    descricao { Faker::Name.title }
    data {Faker::Time.between(DateTime.now, DateTime.now + 365.days)}
  end
end