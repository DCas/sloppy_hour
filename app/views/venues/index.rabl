collection @venues
attributes :id, :name, :address, :website, :distance
child :todays_deals do
	attributes :id, :title, :description
	child :schedule do
		attributes :days, :start_time, :end_time
	end
end