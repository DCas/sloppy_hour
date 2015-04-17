FactoryGirl.define do
  
  factory :deal, aliases: [:schedulable] do
    title "Example Deal"
    description "Example deal description"
    venue
    schedule

    factory :deal_with_occurrences do

      transient do
        deal_occurrences_count 1
      end

      after(:create) do |deal, evaluator|
        create_list(:deal_occurrence, evaluator.deal_occurrences_count, deal: deal)
      end

    end
  end

end
