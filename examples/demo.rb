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
puts  Calendar.for_week(4).show
