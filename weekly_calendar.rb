require_relative "./calendar_constants"

class WeeklyCalendar
    include CalendarConstants

    attr_reader :week_number, :month, :year

    def initialize(week_number, month, year)
        if !(week_number || month || year)
            raise "Required Week-Number, Month and/or Year components missing"
        end

        @week_number = week_number
        @month = month
        @year = year
    end

    def generate
       weeks_first_weekday_number, weeks_first_weekday_date =
            Calendar.first_weekday_number_and_date_of_week_number_of_month_in_year(
                year, month, week_number)

        week_calendar = {}
        key = weeks_first_weekday_number
        value = weeks_first_weekday_date
        7.times do |index|
            week_calendar[MAP_WEEKDAY_NUMBER_TO_NAME[key]] = value
            value += 1
            key += 1
            key = 0 if key >= 7
        end
        week_calendar
    end
end
