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
    it "does not respond to class method new" do
        expect(Calendar).not_to respond_to(:new)
    end

    it "responds to class method for_week" do
        expect(Calendar).to respond_to(:for_week)
    end

    it "responds to class method for_month" do
        expect(Calendar).to respond_to(:for_month)
    end

    it "responds to class method for_year" do
        expect(Calendar).to respond_to(:for_year)
    end

    it "responds to instance method of_month" do
        expect(Calendar.for_week(2)).to respond_to(:of_month)
    end

    it "responds to instance method in_year" do
        expect(Calendar.for_week(2)).to respond_to(:in_year)
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

        it "responds to instance method in_year" do
            expect(calendar).to respond_to(:in_year)
        end

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

        it "responds to instance method of_month" do
            expect(calendar).to respond_to(:of_month)
        end

        it "responds to instance method in_year" do
            expect(calendar).to respond_to(:in_year)
        end

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

        it "responds to class method of_month" do
            expect(Calendar).to respond_to(:of_month)
        end

        it "sets the month to received month" do
            expect(calendar.month).to eql(8)
        end

        it "sets the year to current year" do
            expect(calendar.year).to eql(Time.now.year)
        end
    end

    context ".for_current_week" do
        let!(:calendar) { Calendar.for_current_week }

        it "it responds to class method for_current_week" do
            expect(Calendar).to respond_to(:for_current_week)
        end

        it "sets the year to current year" do
            expect(calendar.year).to eql(Time.now.year)
        end

        it "sets the month to current month" do
            expect(calendar.month).to eql(Time.now.month)
        end

        it "sets the week to current week number in year" do
            expect(calendar.week).to eql(Time.now.strftime("%W").to_i)
        end
    end

    context ".for_current_month" do
        let!(:calendar) { Calendar.for_current_month }

        it "it responds to class method for_current_month" do
            expect(Calendar).to respond_to(:for_current_month)
        end

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

        it "it responds to class method for_current_year" do
            expect(Calendar).to respond_to(:for_current_year)
        end

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
    end

end
