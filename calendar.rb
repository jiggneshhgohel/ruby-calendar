class Calendar
    def date_today
        Time.now.day
    end

    def week_day_name_today
        Time.now.strftime('%A')
    end

    def week_day_number_today
        Time.now.wday
    end
end
