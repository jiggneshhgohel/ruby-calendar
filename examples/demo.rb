require './calendar'

puts "Calendar.for_week(4).of_month(8).in_year(2012)"
puts Calendar.for_week(4).of_month(8).in_year(2012).show

puts "==================================\n"

puts "Calendar.for_month(6).in_year(2011)"
puts Calendar.for_month(6).in_year(2011).show

puts "==================================\n"

puts "Calendar.for_current_week"
puts Calendar.for_current_week.show

puts "==================================\n"

puts "Calendar.for_current_month"
puts Calendar.for_current_month.show

puts "==================================\n"

puts "Calendar.for_week(4) - Error"
begin
  Calendar.for_week(4).show
rescue Exception => e
  puts e.message
end

puts "==================================\n"

puts "Calendar.current_week_number_of_current_year"
puts  Calendar.current_week_number_of_current_year

puts "==================================\n"

puts "Calendar.current_week_number_of_current_month"
puts  Calendar.current_week_number_of_current_month

puts "==================================\n"

puts "Calendar.week_number_of_month(Time)"
puts  Calendar.week_number_of_month(Time.new(2013, 12, 15))

puts "==================================\n"

puts "Calendar.week_number_of_year(Time)"
puts  Calendar.week_number_of_year(Time.new(2013, 12, 15))

puts "==================================\n"

# Returns an array wherein
# index 0 holds the weekday number(0 representing Sunday and 6 representing Saturday)
# index 1 holds the weekday date
# of the first date of given week_number in given year-month
# combination.
# For e.g. for Week 4 of Nov 2014 it should return
# [6, 22]
puts "Calendar.first_weekday_number_and_date_of_week_number_of_month_in_year(year, month, week_number)"
print  Calendar.first_weekday_number_and_date_of_week_number_of_month_in_year(2015, 4, 2)


