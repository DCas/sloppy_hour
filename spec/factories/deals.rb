FactoryGirl.define do
  
  factory :deal, aliases: [:schedulable] do
    title "Example Deal"
    description "Example deal description"
    venue
    schedule
  end

end
