module CalendarConstants
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

    MAP_GAP_IN_DAYS_BETWEEN_MONDAY_AND_OTHER_WEEKDAYS = {
        1 => 0, # key represents monday
        2 => 1, # key represents tuesday
        3 => 2, # key represents wednesday
        4 => 3, # key represents thursday
        5 => 4, # key represents friday
        6 => 5, # key represents saturday
        0 => 6  # key represents sunday
    }
end
