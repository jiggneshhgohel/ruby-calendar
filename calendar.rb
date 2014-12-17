require_relative "./class_methods"
require_relative "./calendar_constants"
require_relative "./monthly_calendar"

class Calendar
    extend ClassMethods

    include CalendarConstants

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
        self.class.validate_given_week_number_in_february_given_year(year, month, week)
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
        weeks_first_weekday_number, weeks_first_weekday_date =
            self.class.first_weekday_number_and_date_of_week_number_of_month_in_year(
                year, month, week)

        week_calendar = {}
        key = weeks_first_weekday_number
        value = weeks_first_weekday_date
        7.times do |index|
            week_calendar[MAP_WEEKDAY_NUMBER_TO_NAME[key]] = value
            value += 1
            key += 1
            key = 0 if key >= 7
        end
        week_calendar
    end

    def monthly_calendar
        MonthlyCalendar.new(month, year).generate
    end
end
