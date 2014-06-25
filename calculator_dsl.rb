class Calculator 
attr_accessor :total
	def calculate(&block)
		self.total = 0
		instance_eval(&block)
		puts self.total
	end

	def add(number)
		 self.total += number
	end

	def subtract(number)
		self.total -= number
	end

	def multiply(number)
		self.total *= number
	end

	def divide(number)
		self.total /= number
	end
end

h = Calculator.new
h.calculate do
	add 3
	add 5
	subtract -5
end


