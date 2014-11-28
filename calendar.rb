require_relative "calendar_helper"

class Calendar
    include CalendarHelper

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

    def weekday_number_tomorrow
        weekday_number(tomorrow_datetime_object)
    end
end
