collection @venues
attributes :id, :name, :address, :website, :distance
child :todays_deals do
	attributes :id, :title, :description
end