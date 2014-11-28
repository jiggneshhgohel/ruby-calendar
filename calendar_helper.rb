module CalendarHelper
    SECONDS_IN_ONE_DAY = (1 * 60 * 60 * 24)

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
