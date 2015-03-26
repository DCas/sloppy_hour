FactoryGirl.define do
  
  factory :schedule do
  	date Date.today
  	rule "daily"
  	interval "1"
  end

end
