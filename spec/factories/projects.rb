FactoryBot.define do
  factory :project do
    name { Faker::JapaneseMedia::OnePiece.character }
    status { 0 }

    user
  end
end
