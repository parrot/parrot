require 'test'
plan 3

r = Range.new(1,10)
proclaim r.include?(5), '.include? for Range'
#proclaim !r.include?(100), '.include? for Range' # !<variable.include?> parsing seems to be broken
proclaim r.member?(6), '.member? for Range'
proclaim r.covers?(9), '.covers? for Range'
