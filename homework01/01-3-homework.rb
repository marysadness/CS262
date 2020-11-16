
class CustomeSymbol < Symbol
	def symbol_all(symbols, symbol)
		return symbols.all_symbols(symbol)
	end

	def between(symbols, a, b)
		return symbols.between?(a, b) 
	end

end


