require_relative "./class_methods"
require 'date'

class Calendar
    extend ClassMethods

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
end
