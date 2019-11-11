module Fibonacci
  def self.recursive(num)
    num <=2 ? 1 : self.recursive(num-1) + self.recursive(num-2)
  end

  def self.iterative(num)
    fib_array = []
    (0..num).each do |n|
      n < 2 ? fib_array << n : fib_array << fib_array[n-1] + fib_array[n-2]
    end
    fib_array.last
  end
end

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { Fibonacci.recursive(num) }
  x.report("iterative_fib") { Fibonacci.iterative(num) }
end