class Calendar
    SECONDS_IN_ONE_DAY = (1 * 60 * 60 * 24)

    def date_today
        current_datetime_object.day
    end

    def weekday_name_today
        weekday_name_from_date(current_datetime_object)
    end

    def weekday_number_today
        week_day_number_from_date(current_datetime_object)
    end

    def date_yesterday
        yesterday_datetime_object.day
    end

    def weekday_name_yesterday
        weekday_name_from_date(yesterday_datetime_object)
    end

    def weekday_number_yesterday
        week_day_number_from_date(yesterday_datetime_object)
    end

    private

    def current_datetime_object
        Time.now
    end

    def yesterday_datetime_object
        (current_datetime_object - SECONDS_IN_ONE_DAY)
    end

    def weekday_name_from_date(datetime_object)
        datetime_object.strftime('%A')
    end

    def week_day_number_from_date(datetime_object)
        datetime_object.wday
    end
end
