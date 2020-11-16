
class CustomeTime < Time
	def time_now()
		return Time.now()
	end

	def time_day()
		t = Time.local(time_now())     
		return t.friday?
	end

	def local_zone()
		return Time.time_now().zone
	end 

end


