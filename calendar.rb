require_relative "./class_methods"

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
        if month && !year
            raise "Incorrect API Usage.Required year component missing."
        end

        if week && !(year && month)
            raise "Incorrect API Usage.Required month and year components missing."
        end
    end
end
