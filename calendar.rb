class Calendar
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
            #  Week number of the year. The week starts with Monday. (00..53)
            new(time.year, time.month, time.strftime("%W").to_i)
        end

        def for_current_month
            time = current_time
            new(time.year, time.month)
        end

        def for_current_year
            new(current_time.year)
        end

        private

        def current_time
            Time.now
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
