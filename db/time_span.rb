require 'active_support/all'

class TimeSpan
  @@start_day = '2014-2-24'
  attr_accessor :day, :start_time, :end_time, :duration, :time_range
  def initialize(day, start_time, end_time)
    @day = day
    @start_time = DateTime.parse(@@start_day + ' ' + start_time)  + (@day - 1)
    @end_time = DateTime.parse(@@start_day + ' ' + end_time)  + (@day - 1)
    @duration = @end_time - @start_time # Do we need this at all?
    @time_range = @start_time..(@end_time - 1.minute) # To keep adjacent hours from overlapping
  end
  def overlaps?(other)
    @time_range.overlaps? other.time_range
  end
  def to_s
    "#{@day}:#{@start_time.strftime("%I:%M %p")} #{@duration} #{@time_range}"
  end
end