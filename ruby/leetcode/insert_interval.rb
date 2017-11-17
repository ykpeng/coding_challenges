# Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
# 
# You may assume that the intervals were initially sorted according to their start times.
# 
# Example 1:
# Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].
# 
# Example 2:
# Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as [1,2],[3,10],[12,16].
# 
# This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].

# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @param {Interval} new_interval
# @return {Interval[]}
def insert(intervals, new_interval)
  res = []
  i = 0
  while i < intervals.length && (intervals[i].start < new_interval.start)
    res << intervals[i]
    i += 1
  end
  
  if res.last && res.last.end >= new_interval.start
    res.last.end = [res.last.end, new_interval.end].max
  else
    res << new_interval
  end
  
  intervals[i..-1].each do |interval|
    if res.last && res.last.end >= interval.start
      res.last.end = [res.last.end, interval.end].max
    else
      res << interval
    end
  end
  
  res
end

def insert2(intervals, new_interval)
  s, e = new_interval.start, new_interval.end
  left, right = [], []
  intervals.each do |interval|
    if interval.end < new_interval.start
      left << interval
    elsif interval.start > new_interval.end
      right << interval
    else
      s = [s, interval.start].min
      e = [e, interval.end].max
    end
  end
  left + [Interval.new(s, e)] + right
end