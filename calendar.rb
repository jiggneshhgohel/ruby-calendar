class Calendar
    private_class_method :new

    class << self
        def for_year(year)
            #TODO
        end

        alias_method :in_year, :for_year

        def for_month(month)
            #TODO
        end

        alias_method :of_month, :for_month

        def for_week(week)
            #TODO
        end
    end
end
