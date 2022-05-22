# frozen_string_literal: true

# HELPER code

low_a, high_a = intervals_a[idx_a]
low_b, high_b = intervals_b[idx_b]

# overlap
low = [low_a, low_b].max
high = [high_a, high_b].min

# merge (assume sorted) 和overlap反过来

has_overlap = high_a >= low_b
if has_overlap
  low = [low_a, low_b].min
  high = [high_a, high_b].max
end

# MERGE INTERVALS - SLIDING WINDOW

def merge(intervals)
  return [] if intervals.empty?

  intervals.sort!

  merged_intervals = []
  window = intervals[0]

  (1...intervals.length).each do |end_idx|
    interval = intervals[end_idx]
    if window.last < interval.first # could be >=
      merged_intervals << window
      window = interval
    end

    # we dont need window[0] = [...].min because its sorted
    window[1] = [window.last, interval.last].max
  end
  merged_intervals << window
  merged_intervals
end

# Event / Interval

Event = Struct.new(:time)

class BusyTime < Event; end
class FreeTime < Event; end

def complex_schedule(schedule)
  events = []

  # time_schedules_map = Hash.new {|h,k| h[k] = []}
  schedule.each do |intervals|
    intervals.each do |interval|
      events << BusyTime.new(interval.start)
      events << FreeTime.new(interval.end)
    end
  end
  events.sort_by!(&:time)

  free_times = [] # final return an array of intervals
  window = []
  busy_count = 0

  # sliding window
  events.each do |event|
    busy_count += 1 if event.is_a?(BusyTime)
    busy_count -= 1 if event.is_a?(FreeTime)

    # window starts: 开始free (如果求busy time则 busy_count > 0)
    if busy_count == 0 && window.empty?            
      window << event.time
    elsif busy_count > 0 && window.length == 1     
      # close window && update free times（新来的event让free window结束了） 
      window << event.time
      free_times << Interval.new(window[0], window[1]) if window[0] != window[1]
      window = []
    end
  end
  free_times
end

# Intersections

def interval_intersection(intervals_a, intervals_b)
  idx_a = 0
  idx_b = 0
  intersections = []
  while idx_a < intervals_a.length && idx_b < intervals_b.length
    low_a, high_a = intervals_a[idx_a]
    low_b, high_b = intervals_b[idx_b]

    low = [low_a, low_b].max
    high = [high_a, high_b].min
    intersections << [low, high] if low <= high
    if high_a < high_b
      idx_a += 1
    else
      idx_b += 1
    end
  end
  intersections
end
