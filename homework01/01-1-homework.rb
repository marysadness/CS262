
class CustomeFile < File
	def absolute(path)
		return expand_file(path)
	end

	def directory(path)
		return directory?(path)
	end

	def exist(path)
		return exist?(path)
	end 

	def modification_time(path)
		return mtime(path)
	end

end


