FactoryGirl.define do
  factory :question do
    phrase "Example question"
    #calling this invokes the language factory
    language
  end
end