module ClassMethods
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
        year_day_number = time.yday

        # Adding 1 for handling the special cases like first week dates
        # whose division by 7 returns 0
        (year_day_number / 7) + 1
    end

    def current_time
        Time.now
    end
end
