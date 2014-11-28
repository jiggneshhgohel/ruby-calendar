class Calendar
    SECONDS_IN_ONE_DAY = (1 * 60 * 60 * 24)

    # Today Helpers
    def date_today
        day_number_in_month_from_date(current_datetime_object)
    end

    def weekday_name_today
        weekday_name_from_date(current_datetime_object)
    end

    def weekday_number_today
        week_day_number_from_date(current_datetime_object)
    end

    # Yesterday Helpers
    def date_yesterday
        day_number_in_month_from_date(yesterday_datetime_object)
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

    def day_number_in_month_from_date(datetime_object)
        datetime_object.mday
    end
end
