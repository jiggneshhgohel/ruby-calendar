class Calendar
    MAP_MONTH_NUMBER_TO_MONTH_DETAILS = {
        "1" =>  [ :jan, 31 ],
        "2" =>  [ :feb, 28 ], # TODO: Leap year days to be handled later
        "3" =>  [ :mar, 31 ],
        "4" =>  [ :apr, 30 ],
        "5" =>  [ :may, 31 ],
        "6" =>  [ :jun, 30 ],
        "7" =>  [ :jul, 31 ],
        "8" =>  [ :aug, 31] ,
        "9" =>  [ :sep, 30 ],
        "10" => [ :oct, 31 ],
        "11" => [ :nov, 30 ],
        "12" => [ :dec, 31 ]
    }

    private_class_method :new

    attr_reader :year, :month, :week

    def initialize(year, month=nil, week=nil)
        @year = year
        @month = month
        @week = week
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
    end

    class << self
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
            new(time.year, time.month, current_week_number_of_current_year)
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
            week_number = (year_day_number / 7) + 1
            if 0 == (year_day_number % 7)
                week_number -= 1
            end
            week_number
        end

        private

        def current_time
            Time.now
        end

        # TODO: Expects numeric month number.Later support for downcased abbreviated
        # month name can be added
        def number_of_days_in_month(month)
            MAP_MONTH_NUMBER_TO_MONTH_DETAILS[month.to_s][1]
        end

    end

    private

    def validate_object_state
        if month && !year
            raise "Incorrect API Usage.Required year component missing."
        end

        if week && !(year && month)
            raise "Incorrect API Usage.Required month and year components missing."
        end
    end
end
