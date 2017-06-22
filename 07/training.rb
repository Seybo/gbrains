require 'net/http'
require 'active_support/all'

module L07
  def self.test_http
    # Net::HTTP.get 'wesbos.com', '/wp-json/wp/v2/posts'
    URI('wesbos.com/wp-json/wp/v2/posts')
  end

  def test_numeric
    2.hours
  end

  def self.fizzbuzz
    check_fizz = proc { |number| number % 3 == 0 ? 'Fizz' : number }
    check_buzz = proc { |number| number % 5 == 0 ? 'Buzz' : number }

  end

  def self.maximum_sequence(array)
    results = {}
    (1..array.length).step do |length|
      array.each_cons(length) { |cons| results[cons] = cons.reduce(&:+) }
    end
    results.key(results.values.max)
  end
end
