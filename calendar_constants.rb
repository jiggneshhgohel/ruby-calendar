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
end
