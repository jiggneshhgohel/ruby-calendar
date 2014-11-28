class Calendar
    def date_today
        current_datetime_object.day
    end

    def week_day_name_today
        current_datetime_object.strftime('%A')
    end

    def week_day_number_today
        current_datetime_object.wday
    end

    private

    def current_datetime_object
        Time.now
    end
end
