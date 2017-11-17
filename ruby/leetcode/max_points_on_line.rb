# Given n points on a 2D plane, find the maximum number of points that lie on the same straight line.

require 'byebug'
# Definition for a point.
class Point
  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end
end

# @param {Point[]} points
# @return {Integer}
def max_points(points)
  length = points.length
  max_count = 0

  (0...length).each do |i|
    local_max_count = 0
    slopes = Hash.new { |h, k| h[k] = Hash.new { |h, k| h[k] = 0 } }

    same_point_count = 1

    (i + 1...length).each do |j|
      x = points[i].x - points[j].x
      y = points[i].y - points[j].y

      if x == 0 && y == 0
        same_point_count += 1
        next
      end

      gcd = gcd(x, y)
      if gcd != 0
        x /= gcd
        y /= gcd
      end

      slopes[x][y] += 1
      local_max_count = [slopes[x][y], local_max_count].max
    end

    max_count = [max_count, local_max_count + same_point_count].max
  end

  max_count
end

def gcd(a, b)
  if b == 0
    return a
  end

  gcd(b, a%b)
end

p1 = Point.new(0, 0)
p2 = Point.new(94911151,94911150)
p3 = Point.new(94911152,94911151)

p max_points([])
