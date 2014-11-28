class Calendar
    SECONDS_IN_ONE_DAY = (1 * 60 * 60 * 24)

    # Today Helpers
    def date_today
        monthday_number(current_datetime_object)
    end

    def weekday_name_today
        weekday_name(current_datetime_object)
    end

    def weekday_number_today
        weekday_number(current_datetime_object)
    end

    # Yesterday Helpers
    def date_yesterday
        monthday_number(yesterday_datetime_object)
    end

    def weekday_name_yesterday
        weekday_name(yesterday_datetime_object)
    end

    def weekday_number_yesterday
        weekday_number(yesterday_datetime_object)
    end

    # Tomorrow Helpers
    def date_tomorrow
        monthday_number(tomorrow_datetime_object)
    end

    def weekday_name_tomorrow
        weekday_name(tomorrow_datetime_object)
    end

    private

    def current_datetime_object
        Time.now
    end

    def yesterday_datetime_object
        (current_datetime_object - SECONDS_IN_ONE_DAY)
    end

    def tomorrow_datetime_object
        (current_datetime_object + SECONDS_IN_ONE_DAY)
    end

    def weekday_name(datetime_object)
        datetime_object.strftime('%A')
    end

    def weekday_number(datetime_object)
        datetime_object.wday
    end

    def monthday_number(datetime_object)
        datetime_object.mday
    end
end
