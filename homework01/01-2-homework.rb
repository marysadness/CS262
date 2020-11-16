class CustomeHash < Hash
	def delete(hash, key, value)
		return hash.delete_if {|key, value| key <= 10 }
	end

	def empty(hash)
		return hash.empty?
	end

end


