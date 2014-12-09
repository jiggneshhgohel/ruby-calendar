require_relative "./class_methods"
require 'date'

class Calendar
    extend ClassMethods

    MAP_MONTH_NUMBER_TO_MONTH_DETAILS = {
        1  => [ :jan, 31 ],
        2  => [ :feb, 28 ], # TODO: Leap year days to be handled later
        3  => [ :mar, 31 ],
        4  => [ :apr, 30 ],
        5  => [ :may, 31 ],
        6  => [ :jun, 30 ],
        7  => [ :jul, 31 ],
        8  => [ :aug, 31] ,
        9  => [ :sep, 30 ],
        10 => [ :oct, 31 ],
        11 => [ :nov, 30 ],
        12 => [ :dec, 31 ]
    }

    MAP_WEEKDAY_NUMBER_TO_NAME = {
        1 => :mon,
        2 => :tue,
        3 => :wed,
        4 => :thu,
        5 => :fri,
        6 => :sat,
        0 => :sun
    }

    private_class_method :new

    attr_reader :year, :month, :week, :view_type

    def initialize(year, month=nil, week=nil)
        @year = year
        @month = month
        @week = week
        @view_type = nil
    end

    def in_year(year)
        @year = year
        self
    end

    def of_month(month)
        @month = month
        self
    end

    def show
        validate_object_state

        set_view_type

        case view_type
            when :weekly
                weekly_calendar
            when :monthly
                monthly_calendar
            when :yearly
                yearly_calendar
            else
                {}
        end
    end

    private

    def validate_object_state
        if month
            if !year
                raise "Incorrect API Usage.Required year component missing."
            end

            unless month.between?(1, 12)
               raise "Month number #{month} passed is invalid.It must be between 1 and 12"
            end
        end

        if week
            if !(year && month)
                raise "Incorrect API Usage.Required month and year components missing."
            end

            if week.between?(1, 5)
                validate_given_week_number_in_february_given_year
            else
               raise "Week-number #{week} passed is invalid.It must be between 1 and 5"
            end
        end
    end

    def validate_given_week_number_in_february_given_year
        if (year && 2 == month)
            is_given_year_leap = Time.new(year).to_date.leap?

            if !is_given_year_leap && week > 4
                raise "February #{year} doesn't have week-number #{week}"
            end
        end
    end

    def set_view_type
        if year
            if month
                @view_type = (week ? :weekly : :monthly)
            else
                @view_type = :yearly
            end
        end
    end

    def weekly_calendar
        # TODO
    end

    def monthly_calendar
        time = Time.new(year, month)

        date_range = Range.new(1, number_of_days_in_month(month))

        # Code-snippet below for a date range of 1..(total_days_in_month)
        # always returns a hash mapping week-day-number TO
        # an array of dates falling on the week-day. For e.g. for months
        # having 31 days the returned hash would always be following:
        # {
        #   1=>[1, 8, 15, 22, 29],  # Monday
        #   2=>[2, 9, 16, 23, 30],  # Tuesday
        #   3=>[3, 10, 17, 24],     # Wednesday
        #   4=>[4, 11, 18, 25],     # Thursday
        #   5=>[5, 12, 19, 26],     # Friday
        #   6=>[6, 13, 20, 27],     # Saturday
        #   0=>[7, 14, 21, 28]      # Sunday
        # }
        # week-day-number (the key in hash) corresponds to day number returned
        # by Time#wday)
        weekday_dates_grouped_by_calculated_weekday_number = date_range.group_by { |date| date % 7 }

        # However it is not necessary that the first date of month
        # always falls on Monday (having wday 1).For e.g. in November 2014
        # 1st date falls on Saturday.Thus the hash returned by
        # group_by above needs to be adjusted such that the dates in the
        # month correspond to correct week-day-number
        weekday_numbers_starting_from_first_date_weekday = []
        first_date_weekday_number = time.wday
        counter = first_date_weekday_number = time.wday
        7.times do |index|
            weekday_numbers_starting_from_first_date_weekday << counter
            counter += 1
            counter = 0 if counter >= 7
        end

        weekday_dates_grouped_by_calculated_weekday_number_arr = weekday_dates_grouped_by_calculated_weekday_number.to_a
        weekday_dates_grouped_by_actual_weekday_number = {}
        7.times do |index|
            key   = weekday_numbers_starting_from_first_date_weekday[index]
            value = weekday_dates_grouped_by_calculated_weekday_number_arr[index].last
            weekday_dates_grouped_by_actual_weekday_number[key] = value
        end

        hash = Hash.new([])
        MAP_WEEKDAY_NUMBER_TO_NAME.each do |day_number, day_name|
            hash[day_name] = weekday_dates_grouped_by_actual_weekday_number[day_number]
        end
        hash
    end

    # TODO: Expects numeric month number.Later support for downcased abbreviated
    # month name can be added
    def number_of_days_in_month(month)
        MAP_MONTH_NUMBER_TO_MONTH_DETAILS[month][1]
    end
end
