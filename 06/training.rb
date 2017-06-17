class Foo
  alias create new
  attr_accessor :bar, :baz
  def initialize
    yield self if block_given?
  end
end

fff = Foo.new do |f|
  f.bar = 123
  f.baz = 456
end

puts fff
