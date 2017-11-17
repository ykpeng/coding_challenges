# Given a collection of intervals, merge all overlapping intervals.
# 
# For example,
# Given [1,3],[2,6],[8,10],[15,18],
# return [1,6],[8,10],[15,18].

# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)  
  if intervals.length < 2
    return intervals
  end
  
  intervals.sort_by! { |interval| interval.start }
  res = []
  curr_inter = intervals.first
  
  intervals[1..-1].each do |interval|
    if curr_inter.end >= interval.start
      new_end = [curr_inter.end, interval.end].max
      curr_inter.end = new_end
    else
      res << curr_inter
      curr_inter = interval
    end
  end
  
  res << curr_inter
  
  res
end

def merge2(intervals)
  res = []
  intervals.sort_by! { |interval| interval.start }

  intervals.each do |interval|
    if !res.empty? && res.last.end >= interval.start
      new_end = [res.last.end, interval.end].max
      res.last.end = new_end
    else
      res << interval
    end
  end
  
  res
end