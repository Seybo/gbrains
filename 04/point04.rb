class Point
  include Math
  include Comparable

  attr_accessor :x, :y

  def initialize(x: nil, y: nil)
    @x = x
    @y = y
  end

  def to_s
    "Point (#{@x}, #{@y})"
  end

  def inspect
    "Point<x = #{@x}, y = #{@y}>"
  end

  def similar_quoter?(other)
    x.abs / x == other.x.abs / other.x &&
      y.abs / y == other.y.abs / other.y
  end

  def at_zero?
    x.zero? && y.zero?
  end

  def put_to_zero!
    @x = @y = 0
  end

  def +(other)
    Point.new(x: x + other.x, y: y + other.y)
  end

  def <=>(other)
    return nil unless other.class == Point
    hypot(x, y) <=> hypot(other.x, other.y)
  end
end

class Rectangle
  def initialize(point1, point2)
    @point1 = point1
    @point2 = point2
  end

  def area
    x_side * y_side
  end

  def perimeter
    2 * (x_side + y_side)
  end

  private

  def x_side
    @x_side ||= (@point1.x - @point2.x).abs
  end

  def y_side
    @y_side ||= (@point1.y - @point2.y).abs
  end

  def to_s
    puts 'haha'
    "#{x_side} and #{y_side}"
  end
end
