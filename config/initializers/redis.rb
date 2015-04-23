if ENV["REDISCLOUD_URL"]
    $redis = Redis.new(:url => ENV["REDISCLOUD_URL"])
else
	$redis = Redis::Namespace.new("sloppy_hour", :redis => Redis.new)
end