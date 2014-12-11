require_relative "./calendar_constants"

require 'date'

module ClassMethods
    include CalendarConstants

    def for_year(year)
        new(year)
    end

    def for_month(month)
        new(nil, month)
    end

    def of_month(month)
        new(Time.now.year, month)
    end

    def for_week(week)
        new(nil, nil, week)
    end

    def for_current_week
        time = current_time
        new(time.year, time.month, current_week_number_of_current_month)
    end

    def for_current_month
        time = current_time
        new(time.year, time.month)
    end

    def for_current_year
        new(current_time.year)
    end

    def current_week_number_of_current_year
        week_number_of_year # by default this method uses current datetime
    end

    def current_week_number_of_current_month
        week_number_of_month # by default this method uses current datetime
    end

    def week_number_of_month(time=Time.now)
        raise "Time instance required!" unless time.is_a? Time
        month_day_number = time.day

        # Adding 1 for handling the special cases like first week dates
        # whose division by 7 returns 0
        week_number = (month_day_number / 7) + 1

        if 0 == (month_day_number % 7)
            week_number -= 1
        end
        week_number
    end

    def week_number_of_year(time=Time.now)
        raise "Time instance required!" unless time.is_a? Time

        year_day_number = time.yday

        # Adding 1 for handling the special cases like first week dates
        # whose division by 7 returns 0
        (year_day_number / 7) + 1
    end

    def start_date_of_week_number_in_month(week_number)
        # TODO: Handle exception cases like week_number is less than 0
        # or greater than 5

        # If week-number is 4 then 7 * 4 = 28 which is the last date
        # in 4th week. Thus using previous week-number to calculate the
        # date and adding 1 to it to get the start date of week
        (7 * (week_number - 1)) + 1
    end

    def starting_weekday_of_week_number_in_month(year, month, week_number)
        if week_number.between?(1, 5)
            validate_given_week_number_in_february_given_year(year, month, week_number)
        else
           raise "Week-number #{week_number} passed is invalid.It must be between 1 and 5"
        end

        starting_date_of_week = start_date_of_week_number_in_month(week_number)
        weekday_number = Time.new(year, month, starting_date_of_week).wday
        MAP_WEEKDAY_NUMBER_TO_NAME[weekday_number]
    end

    def current_time
        Time.now
    end

    def validate_given_week_number_in_february_given_year(year, month, week_number)
        if (year && 2 == month)
            is_given_year_leap = Time.new(year).to_date.leap?

            if !is_given_year_leap && week_number > 4
                raise "February #{year} doesn't have week-number #{week_number}"
            end
        end
    end
end
