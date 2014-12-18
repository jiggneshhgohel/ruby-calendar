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

    def date_on_first_monday_of_year(received_year)
        received_year_time = Time.new(received_year)
        received_year_first_date_weekday = received_year_time.wday

        received_year_first_monday_date = received_year_time.day
        gap_in_days = MAP_GAP_IN_DAYS_BETWEEN_MONDAY_AND_OTHER_WEEKDAYS[received_year_first_date_weekday]
        if gap_in_days > 0
            calculated_monday_time = received_year_time - (60 * 60 * 24 * gap_in_days)

            if calculated_monday_time.year < received_year
                received_year_first_monday_time = calculated_monday_time + (60 * 60 * 24 * 7)
                received_year_first_monday_date = received_year_first_monday_time.day
            end
        end

        received_year_first_monday_date
    end

    # Note: This method relies on the fact that Week starts on Monday and
    # ends on Sunday. The results returned by it are to be verified
    # by the value returned by following code: Time#strftime("%W").to_i + 1
    # Note: Time#strftime("%W") returns a 0-based string value. For e.g
    # 1st week of the month is returned as "00".
    def week_number_of_year(time=Time.now)
        raise "Time instance required!" unless time.is_a? Time

        first_monday_date = date_on_first_monday_of_year(time.year)

        year_day_number = time.yday

        if year_day_number <= 7
            week_number = 1

            if year_day_number > 1 && year_day_number.between?(first_monday_date, first_monday_date + 6)
                week_number += 1
            end

            return week_number
        end

        week_number = (year_day_number - first_monday_date) / 7
        week_number += 1 # as result is 0-based
        week_number += 1 if first_monday_date != 1 # Add one more week because 1st monday doesn't fall on 1st date.

        week_number
    end

    # Returns ideal first date of week-number, considering week always
    # start at 1st of the month and ends on the subsequent 7th day.
    # For e.g. for Week 1 the first date returned would be 1
    # Similarly for Week 2 the first date returned would be 8, etc
    def ideal_first_date_of_week_number(week_number)
        unless week_number.between?(1, 5)
            raise "Week-number #{week_number} passed is invalid.It must be between 1 and 5"
        end

        # If week-number is 4 then 7 * 4 = 28 which is the last date
        # in 4th week. Thus using previous week-number to calculate the
        # date and adding 1 to it to get the start date of week
        (7 * (week_number - 1)) + 1
    end

    # Returns an array wherein
    #   index 0 holds the weekday number(0 representing Sunday and 6 representing Saturday)
    #   index 1 holds the weekday date
    # of the first date of given week_number in given year-month
    # combination.
    # For e.g. for Week 4 of Nov 2014 it should return
    # [6, 22]
    def first_weekday_number_and_date_of_week_number_of_month_in_year(year, month, week_number)
        if week_number.between?(1, 5)
            validate_given_week_number_in_february_given_year(year, month, week_number)
        else
           raise "Week-number #{week_number} passed is invalid.It must be between 1 and 5"
        end

        first_date_of_week = ideal_first_date_of_week_number(week_number)
        weekday_number = Time.new(year, month, first_date_of_week).wday
        [weekday_number, first_date_of_week]
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
