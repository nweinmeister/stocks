require_relative('../nails.rb')

class TestCase
	def initialize
		@all_passed = true
	end

	def run_tests
		my_methods = self.class.instance_methods(false)
		my_methods.each do |my_method|
			split_string = my_method.to_s.split("_")
			run_test(my_method) if split_string[0] == "test"
		end
		output_result
	end

	def run_test(method_name)
		setup
		self.send(method_name)
	end

	def output_result
		puts("\nAll passed!") if @all_passed
	end

	def setup
		return nil
	end

	def assert_equal(expected, actual)
		if expected == actual
			print(".")
		else
			puts("Expected #{expected}, got #{actual}.\n")
			@all_passed = false
		end
	end
end