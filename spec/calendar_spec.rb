require_relative '../calendar'

# Desired Calendar API:
#   Calendar.for_week(4).of_month(8).in_year(2012).show # Weekly view
#   Calendar.for_month(6).in_year(2011).show            # Monthly view
#   Calendar.for_year(2014).show                        # Yearly view
#   Calendar.of_month(5).show                           # Monthly view (current years' month calendar)

#   Calendar.for_current_week.show                      # Weekly view
#   Calendar.for_current_month.show                     # Monthly View
#   Calendar.for_current_year.show                      # Yearly view

#   Calendar.for_week(4).show                           # Incorrect.Please set month and year
#   Calendar.for_month(7).show                          # Incorrect.Please set year or use of_month
#   Calendar.for_week(3).in_month(7).show               # Incorrect.Please set year

#   Calendar.ideal_first_date_of_week_number(4)
#   Calendar.first_weekday_number_and_date_of_week_number_of_month_in_year(2014, 10, 3)

describe Calendar do
    it "does not have class method new" do
        expect(Calendar).not_to respond_to(:new)
    end

    context "has class method" do
        it "for_week" do
            expect(Calendar).to respond_to(:for_week)
        end

        it "for_month" do
            expect(Calendar).to respond_to(:for_month)
        end

        it "for_year" do
            expect(Calendar).to respond_to(:for_year)
        end

        it "of_month" do
            expect(Calendar).to respond_to(:of_month)
        end

        it "for_current_week" do
            expect(Calendar).to respond_to(:for_current_week)
        end

        it "for_current_month" do
            expect(Calendar).to respond_to(:for_current_month)
        end

        it "for_current_year" do
            expect(Calendar).to respond_to(:for_current_year)
        end

        it "date_on_first_monday_of_year" do
            expect(Calendar).to respond_to(:date_on_first_monday_of_year)
        end

        it "week_number_of_month" do
            expect(Calendar).to respond_to(:week_number_of_month)
        end

        it "week_number_of_year" do
            expect(Calendar).to respond_to(:week_number_of_year)
        end

        it "ideal_first_date_of_week_number" do
            expect(Calendar).to respond_to(:ideal_first_date_of_week_number)
        end

        it "first_weekday_number_and_date_of_week_number_of_month_in_year" do
            expect(Calendar).to respond_to(:first_weekday_number_and_date_of_week_number_of_month_in_year)
        end

        it "current_week_number_of_current_year" do
            expect(Calendar).to respond_to(:current_week_number_of_current_year)
        end

        it "current_week_number_of_current_month" do
            expect(Calendar).to respond_to(:current_week_number_of_current_month)
        end
    end

    context "has instance method" do
        it "of_month" do
            expect(Calendar.for_week(2)).to respond_to(:of_month)
        end

        it "in_year" do
            expect(Calendar.for_week(2)).to respond_to(:in_year)
        end

        it "show" do
            expect(Calendar.for_week(2)).to respond_to(:show)
        end
    end

    context ".date_on_first_monday_of_year" do
        it "returns the date falling on the first monday of given year" do
            expect(Calendar.date_on_first_monday_of_year(2010)).to eql(4)
            expect(Calendar.date_on_first_monday_of_year(2011)).to eql(3)
            expect(Calendar.date_on_first_monday_of_year(2012)).to eql(2)
            expect(Calendar.date_on_first_monday_of_year(2013)).to eql(7)
            expect(Calendar.date_on_first_monday_of_year(2014)).to eql(6)
            expect(Calendar.date_on_first_monday_of_year(2015)).to eql(5)
            expect(Calendar.date_on_first_monday_of_year(2016)).to eql(4)
            expect(Calendar.date_on_first_monday_of_year(2017)).to eql(2)
            expect(Calendar.date_on_first_monday_of_year(2018)).to eql(1)
            expect(Calendar.date_on_first_monday_of_year(2019)).to eql(7)
        end
    end

    context ".week_number_of_month" do
        it "returns the week-number of month in which given date lies" do
            # TODO: Week starts on 1st and subsequently ends on date 7th day
            # from current date.Is this correct? Or it should also be
            # counted from Monday to Sunday like it is done in case of
            # calculating week-number-of-year?
            expect(Calendar.week_number_of_month(Time.new(2014, 10, 9))).to eql(2)
            expect(Calendar.week_number_of_month(Time.new(2014, 10, 1))).to eql(1)
            expect(Calendar.week_number_of_month(Time.new(2012, 4, 23))).to eql(4)
            expect(Calendar.week_number_of_month(Time.new(2015, 7, 31))).to eql(5)
            expect(Calendar.week_number_of_month(Time.new(2014, 12, 7))).to eql(1)
        end
    end

    context ".week_number_of_year" do
        it "returns the week-number of year in which given date lies" do
            # Note: Week starts on Monday and ends on Sunday

            # ============== Dates between 1 and 7
            # 1st week examples
            expect(Calendar.week_number_of_year(Time.new(2007, 1, 1))).to eql(1)
            expect(Calendar.week_number_of_year(Time.new(2011, 1, 1))).to eql(1)
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 1))).to eql(1)
            expect(Calendar.week_number_of_year(Time.new(2016, 1, 1))).to eql(1)
            expect(Calendar.week_number_of_year(Time.new(2017, 1, 1))).to eql(1)
            expect(Calendar.week_number_of_year(Time.new(2018, 1, 1))).to eql(1)

            # 2nd week examples
            expect(Calendar.week_number_of_year(Time.new(2011, 1, 3))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2011, 1, 7))).to eql(2)

            expect(Calendar.week_number_of_year(Time.new(2014, 1, 6))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 7))).to eql(2)

            expect(Calendar.week_number_of_year(Time.new(2016, 1, 4))).to eql(2)

            expect(Calendar.week_number_of_year(Time.new(2017, 1, 2))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2017, 1, 3))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2017, 1, 4))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2017, 1, 5))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2017, 1, 6))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2017, 1, 7))).to eql(2)

            # ============== Dates beyond 7
            # 2nd week examples
            expect(Calendar.week_number_of_year(Time.new(2007, 1, 8))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 8))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 9))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 12))).to eql(2)
            expect(Calendar.week_number_of_year(Time.new(2018, 1, 8))).to eql(2)

            # 3rd week examples
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 13))).to eql(3)
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 19))).to eql(3)
            expect(Calendar.week_number_of_year(Time.new(2016, 1, 15))).to eql(3)

            # 4th week examples
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 20))).to eql(4)
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 23))).to eql(4)
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 26))).to eql(4)

            # 5th week examples
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 27))).to eql(5)
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 31))).to eql(5)

            # 7th week examples
            expect(Calendar.week_number_of_year(Time.new(2011, 2, 8))).to eql(7)

            # 18th week examples
            expect(Calendar.week_number_of_year(Time.new(2012, 4, 23))).to eql(18)

            # 31st week examples
            expect(Calendar.week_number_of_year(Time.new(2014, 7, 31))).to eql(31)
            expect(Calendar.week_number_of_year(Time.new(2015, 7, 31))).to eql(31)

            # 49th week examples
            expect(Calendar.week_number_of_year(Time.new(2014, 12, 7))).to eql(49)

            # 50th week examples
            expect(Calendar.week_number_of_year(Time.new(2012, 12, 8))).to eql(50)

            # 51st week examples
            expect(Calendar.week_number_of_year(Time.new(2012, 12, 10))).to eql(51)
            expect(Calendar.week_number_of_year(Time.new(2014, 12, 17))).to eql(51)

            # 52nd week examples
            expect(Calendar.week_number_of_year(Time.new(2013, 12, 25))).to eql(52)
            expect(Calendar.week_number_of_year(Time.new(2014, 12, 22))).to eql(52)

            # 53rd week examples
            expect(Calendar.week_number_of_year(Time.new(2013, 12, 30))).to eql(53)

            expect(Calendar.week_number_of_year(Time.new(2014, 12, 29))).to eql(53)
            expect(Calendar.week_number_of_year(Time.new(2014, 12, 31))).to eql(53)

            # 54th week examples
            expect(Calendar.week_number_of_year(Time.new(2012, 12, 31))).to eql(54)
        end
    end

    context ".ideal_first_date_of_week_number" do
        it "returns date on which the week, corresponding to the given week-number in a month, starts" do
            expect(Calendar.ideal_first_date_of_week_number(4)).to eql(22)
            expect(Calendar.ideal_first_date_of_week_number(1)).to eql(1)
            expect(Calendar.ideal_first_date_of_week_number(5)).to eql(29)
        end
    end

    context ".first_weekday_number_and_date_of_week_number_of_month_in_year" do
        it "raises error when given week-number is invalid in context of given month" do
            expect { Calendar.first_weekday_number_and_date_of_week_number_of_month_in_year(2014, 11, 0) }.to raise_error(/Week-number -?\d+ passed is invalid.It must be between 1 and 5/)
        end

        it "raises error when given week-number of February month in a normal year, is found greater than 4" do
            expect { Calendar.first_weekday_number_and_date_of_week_number_of_month_in_year(2014, 2, 5) }.to raise_error(/February \d+ doesn't have week-number \d+/)
        end

        it "does not raise error when given week-number of February month in a leap year, is found greater than 4" do
            expect { Calendar.first_weekday_number_and_date_of_week_number_of_month_in_year(2012, 2, 5) }.not_to raise_error
        end

        it "returns weekday number on which the week, corresponding to the given year-month-week_number combination, starts" do
            expect(Calendar.first_weekday_number_and_date_of_week_number_of_month_in_year(2014, 11, 4)).to eql({ 6 => 22 }.to_a.flatten)
            expect(Calendar.first_weekday_number_and_date_of_week_number_of_month_in_year(2014, 8, 2)).to eql({ 5 => 8 }.to_a.flatten)
            expect(Calendar.first_weekday_number_and_date_of_week_number_of_month_in_year(2014, 6, 1)).to eql({ 0 => 1}.to_a.flatten)
        end
    end

    context ".current_week_number_of_current_year" do
        it "returns the ongoing week-number of the current year" do
            expect(Calendar.current_week_number_of_current_year).to eql(current_week_number_of_current_year)
        end
    end

    context ".current_week_number_of_current_month" do
        it "returns the ongoing week-number of the current month" do
            expect(Calendar.current_week_number_of_current_month).to eql(current_week_number_of_current_month)
        end
    end

    context ".for_year" do
        let!(:calendar) { Calendar.for_year(2011) }

        it "sets the year to received year" do
            expect(calendar.year).to eql(2011)
        end

        it "sets the month to nil" do
            expect(calendar.month).to be_nil
        end

        it "sets the week to nil" do
            expect(calendar.week).to be_nil
        end
    end

    context ".for_month.in_year" do
        let!(:calendar) { Calendar.for_month(2).in_year(2012) }

        it "sets the year to received year" do
            expect(calendar.year).to eql(2012)
        end

        it "sets the month to received month" do
            expect(calendar.month).to eql(2)
        end

        it "sets the week to nil" do
            expect(calendar.week).to be_nil
        end
    end

    context ".for_week.of_month.in_year" do
        let!(:calendar) { Calendar.for_week(2).of_month(4).in_year(2014) }

        it "sets the year to received year" do
            expect(calendar.year).to eql(2014)
        end

        it "sets the month to received month" do
            expect(calendar.month).to eql(4)
        end

        it "sets the week to received week" do
            expect(calendar.week).to eql(2)
        end
    end

    context ".of_month" do
        let!(:calendar) { Calendar.of_month(8) }

        it "sets the month to received month" do
            expect(calendar.month).to eql(8)
        end

        it "sets the year to current year" do
            expect(calendar.year).to eql(Time.now.year)
        end
    end

    context ".for_current_week" do
        let!(:calendar) { Calendar.for_current_week }

        it "sets the year to current year" do
            expect(calendar.year).to eql(Time.now.year)
        end

        it "sets the month to current month" do
            expect(calendar.month).to eql(Time.now.month)
        end

        it "sets the week to current week-number of current month" do
            expect(calendar.week).to eql(current_week_number_of_current_month)
        end
    end

    context ".for_current_month" do
        let!(:calendar) { Calendar.for_current_month }

        it "sets the year to current year" do
            expect(calendar.year).to eql(Time.now.year)
        end

        it "sets the month to current month" do
            expect(calendar.month).to eql(Time.now.month)
        end

        it "does not set the week" do
            expect(calendar.week).to be_nil
        end
    end

    context ".for_current_year" do
        let!(:calendar) { Calendar.for_current_year }

        it "sets the year to current year" do
            expect(calendar.year).to eql(Time.now.year)
        end

        it "does not set the month" do
            expect(calendar.month).to be_nil
        end

        it "does not set the week" do
            expect(calendar.week).to be_nil
        end
    end

    context "#show" do
        it "raises error when week is found set without month and year" do
            expect { Calendar.for_week(5).show }.to raise_error(/Incorrect API Usage.Required month and year components missing./)
        end

        it "raises error when month is found set without year" do
            expect { Calendar.for_month(4).show }.to raise_error(/Incorrect API Usage.Required year component missing./)
        end

        it "does not raise error when week is not found set but month and year are set" do
            expect { Calendar.for_month(4).in_year(2011).show }.not_to raise_error
        end

        it "raises error when week and month are found set without year" do
            expect { Calendar.for_week(2).of_month(4).show }.to raise_error(/Incorrect API Usage.Required year component missing./)
        end

        it "raises error when given week-number is invalid in context of given month" do
            expect { Calendar.for_week(7).of_month(3).in_year(2014).show }.to raise_error(/Week-number -?\d+ passed is invalid.It must be between 1 and 5/)
            expect { Calendar.for_week(0).of_month(3).in_year(2014).show }.to raise_error(/Week-number -?\d+ passed is invalid.It must be between 1 and 5/)
        end

        it "raises error when given week-number of February month in a normal year, is found greater than 4" do
            expect { Calendar.for_week(5).of_month(2).in_year(2014).show }.to raise_error(/February \d+ doesn't have week-number \d+/)
        end

        it "does not raise error when given week-number of February month in a leap year, is found greater than 4" do
            expect { Calendar.for_week(5).of_month(2).in_year(2012).show }.not_to raise_error
        end

        it "raises error when given month number is invalid in context of given year" do
            expect { Calendar.for_month(13).in_year(2014).show }.to raise_error(/Month number -?\d+ passed is invalid.It must be between 1 and 12/)
            expect { Calendar.for_month(-1).in_year(2012).show }.to raise_error(/Month number -?\d+ passed is invalid.It must be between 1 and 12/)
        end

        context "when invoked on .for_month.in_year" do
            it "returns a hash mapping week-days to an array of dates, falling on the week-days, in given month-year combination" do
                year_2014 = 2014

                december_month = 12
                expected_december_month_hash = {
                    mon: [ 1, 8, 15, 22, 29],
                    tue: [ 2, 9, 16, 23, 30 ],
                    wed: [ 3, 10, 17, 24, 31 ],
                    thu: [ 4, 11, 18, 25 ],
                    fri: [ 5, 12, 19, 26 ],
                    sat: [ 6, 13, 20, 27 ],
                    sun: [ 7, 14, 21, 28 ]
                }

                actual_december_month_hash = Calendar.for_month(december_month).in_year(year_2014).show
                week_days.each do |day|
                    expect(actual_december_month_hash[day]).to eql(expected_december_month_hash[day])
                end

                #=================

                november_month = 11
                expected_november_month_hash = {
                    mon: [ 3, 10, 17, 24],
                    tue: [ 4, 11, 18, 25 ],
                    wed: [ 5, 12, 19, 26 ],
                    thu: [ 6, 13, 20, 27 ],
                    fri: [ 7, 14, 21, 28 ],
                    sat: [ 1, 8, 15, 22, 29 ],
                    sun: [ 2, 9, 16, 23, 30 ]
                }

                actual_november_month_hash = Calendar.for_month(november_month).in_year(year_2014).show
                week_days.each do |day|
                    expect(actual_november_month_hash[day]).to eql(expected_november_month_hash[day])
                end

                #=================

                july_month = 7
                expected_july_month_hash = {
                    mon: [ 7, 14, 21, 28],
                    tue: [ 1, 8, 15, 22, 29 ],
                    wed: [ 2, 9, 16, 23, 30 ],
                    thu: [ 3, 10, 17, 24, 31 ],
                    fri: [ 4, 11, 18, 25 ],
                    sat: [ 5, 12, 19, 26 ],
                    sun: [ 6, 13, 20, 27 ]
                }

                actual_july_month_hash = Calendar.for_month(july_month).in_year(year_2014).show
                week_days.each do |day|
                    expect(actual_july_month_hash[day]).to eql(expected_july_month_hash[day])
                end
            end
        end

        context "when invoked on .for_week.of_month.in_year" do
            it "returns a hash mapping week-days to date, falling on the week-days, in given week-month-year combination" do
                year_2014 = 2014

                november_month = 11
                november_week = 4
                expected_november_2014_4th_week_hash = {
                    sat: 22,
                    sun: 23,
                    mon: 24,
                    tue: 25,
                    wed: 26,
                    thu: 27,
                    fri: 28
                }

                actual_november_2014_4th_week_hash = Calendar.for_week(november_week)
                                                        .of_month(november_month)
                                                        .in_year(year_2014)
                                                        .show
                week_days.each do |day|
                    expect(actual_november_2014_4th_week_hash[day]).to eql(expected_november_2014_4th_week_hash[day])
                end

                #=================

                may_month = 5
                may_week = 2
                expected_may_2014_2nd_week_hash = {
                    thu: 8,
                    fri: 9,
                    sat: 10,
                    sun: 11,
                    mon: 12,
                    tue: 13,
                    wed: 14
                }

                actual_may_2014_2nd_week_hash = Calendar.for_week(may_week)
                                                   .of_month(may_month)
                                                   .in_year(year_2014)
                                                   .show
                week_days.each do |day|
                    expect(actual_may_2014_2nd_week_hash[day]).to eql(expected_may_2014_2nd_week_hash[day])
                end

                #=================

                year_2012 = 2012
                march_month = 3
                march_week = 1
                expected_march_2012_1st_week_hash = {
                    thu: 1,
                    fri: 2,
                    sat: 3,
                    sun: 4,
                    mon: 5,
                    tue: 6,
                    wed: 7
                }

                actual_march_2012_1st_week_hash = Calendar.for_week(march_week)
                                                          .of_month(march_month)
                                                          .in_year(year_2012)
                                                          .show
                week_days.each do |day|
                    expect(actual_march_2012_1st_week_hash[day]).to eql(expected_march_2012_1st_week_hash[day])
                end
            end
        end


        # TODO: Add more specs

        # TODO: What if year is passed as a two-digit number?

        # http://stackoverflow.com/questions/1489826/how-to-get-the-number-of-days-in-a-given-month-in-ruby-accounting-for-year
        # https://github.com/sachin87/week-of-month/blob/master/lib/modules/day.rb
        # http://en.wikipedia.org/wiki/ISO_week_date#Dates_with_fixed_week_number
    end

    # SPEC HELPER METHODS
    def current_week_number_of_current_year
        # The week-numbers are 0-based thus adding 1 to it.
        Time.now.strftime("%W").to_i + 1
    end

    def current_week_number_of_current_month
        current_date = Time.now.day
        if current_date <= 7
            1
        elsif current_date.between?(8, 14)
            2
        elsif current_date.between?(15, 21)
            3
        elsif current_date.between?(22, 28)
            4
        else
            5
        end
    end

    def week_days
        [ :mon, :tue, :wed, :thu, :fri, :sat, :sun ]
    end
end
