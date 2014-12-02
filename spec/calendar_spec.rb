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
#

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

        it "week_number_of_month" do
            expect(Calendar).to respond_to(:week_number_of_month)
        end

        it "week_number_of_year" do
            expect(Calendar).to respond_to(:week_number_of_year)
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
    end

    context ".week_number_of_month" do
        it "returns the week-number of month in which given date lies" do
            expect(Calendar.week_number_of_month(Time.new(2014, 10, 9))).to eql(2)
            expect(Calendar.week_number_of_month(Time.new(2014, 10, 1))).to eql(1)
            expect(Calendar.week_number_of_month(Time.new(2012, 4, 23))).to eql(4)
            expect(Calendar.week_number_of_month(Time.new(2015, 7, 31))).to eql(5)
            expect(Calendar.week_number_of_month(Time.new(2014, 12, 7))).to eql(1)
        end
    end

    context ".week_number_of_year" do
        it "returns the week-number of year in which given date lies" do
            expect(Calendar.week_number_of_year(Time.new(2014, 1, 1))).to eql(1)
            expect(Calendar.week_number_of_year(Time.new(2011, 2, 8))).to eql(6)
            expect(Calendar.week_number_of_year(Time.new(2012, 4, 23))).to eql(17)
            expect(Calendar.week_number_of_year(Time.new(2015, 7, 31))).to eql(31)
            expect(Calendar.week_number_of_year(Time.new(2014, 12, 7))).to eql(49)
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

        it "sets the week to current week-number of year" do
            expect(calendar.week).to eql(current_week_number_of_current_year)
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
        it "responds to instance method show" do
            expect(Calendar.for_current_week).to respond_to(:show)
        end

        it "raises error when week is found set without month and year" do
            expect { Calendar.for_week(5).show }.to raise_error(/Incorrect API Usage.Required month and year components missing./)
        end

        it "raises error when month is found set without year" do
            expect { Calendar.for_month(4).show }.to raise_error(/Incorrect API Usage.Required year component missing./)
        end

        it "does not raise error when week is not found set but month and year are set" do
            expect { Calendar.for_month(4).in_year(2011).show }.not_to raise_error
        end

        # TODO: Add more specs

        # TODO: What if the week number passed is invalid in context of of_month value
        # For e.g. for_week(7).of_month(6)
        # There cannot be 7 weeks in a month

        # TODO: What if the month number passed is invalid in context of in_year value
        # For e.g. for_month(13).in_year(2012)
        # There cannot be 13th month in a year
        # Similarly there cannot be 0th or negative month in a year

        # http://stackoverflow.com/questions/1489826/how-to-get-the-number-of-days-in-a-given-month-in-ruby-accounting-for-year
        # https://github.com/sachin87/week-of-month/blob/master/lib/modules/day.rb
        # http://en.wikipedia.org/wiki/ISO_week_date#Dates_with_fixed_week_number
    end

    # SPEC HELPER METHODS
    def current_week_number_of_current_year
        Time.now.strftime("%W").to_i
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
end
