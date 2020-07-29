FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    nickname {Faker::Name.initials(number: 2)}
    first_name {'名前'}
    last_name {'苗字'}
    first_name_kana { 'ナマエ' }
    last_name_kana { 'ミョウジ' }
    birthday {Faker::Date.between(from: '1930-01-01', to: Date.today)}

  end
end