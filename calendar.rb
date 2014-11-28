class Calendar
    SECONDS_IN_ONE_DAY = (1 * 60 * 60 * 24)

    def date_today
        current_datetime_object.day
    end

    def weekday_name_today
        current_datetime_object.strftime('%A')
    end

    def weekday_number_today
        current_datetime_object.wday
    end

    def date_yesterday
        yesterday_datetime_object.day
    end

    def weekday_name_yesterday
        yesterday_datetime_object.strftime('%A')
    end

    def weekday_number_yesterday
        yesterday_datetime_object.wday
    end

    private

    def current_datetime_object
        Time.now
    end

    def yesterday_datetime_object
        (current_datetime_object - SECONDS_IN_ONE_DAY)
    end
end
