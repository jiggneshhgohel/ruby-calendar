require_relative '../calendar'

describe Calendar do
    context "#date_today" do
        it "returns today's date" do
            calendar = Calendar.new
            expect(calendar.date_today).to eql(Time.now.day)
        end
    end

    context "#weekday_name_today" do
        it "returns today's week-day name" do
            calendar = Calendar.new
            expect(calendar.weekday_name_today).to eql(Time.now.strftime('%A'))
        end
    end

    context "#weekday_number_today" do
        it "returns today's week-day number" do
            calendar = Calendar.new
            expect(calendar.weekday_number_today).to eql(Time.now.wday)
        end
    end

    context "#date_yesterday" do
        it "returns yesterday's date" do
            calendar = Calendar.new
            expect(calendar.date_yesterday).to eql( (Time.now - Calendar::SECONDS_IN_ONE_DAY).day )
        end
    end

    context "#weekday_name_yesterday" do
        it "returns yesterday's week-day name" do
            calendar = Calendar.new
            expect(calendar.weekday_name_yesterday).to eql( (Time.now - Calendar::SECONDS_IN_ONE_DAY).strftime('%A') )
        end
    end

    context "#weekday_number_yesterday" do
        it "returns yesterday's week-day number" do
            calendar = Calendar.new
            expect(calendar.weekday_number_yesterday).to eql( (Time.now - Calendar::SECONDS_IN_ONE_DAY).wday )
        end
    end

    context "#date_tomorrow" do
        it "returns tomorrow's date" do
            calendar = Calendar.new
            expect(calendar.date_tomorrow).to eql( (Time.now + Calendar::SECONDS_IN_ONE_DAY).day )
        end
    end

    context "#next_week_dates" do
        it "returns an array of dates in next week" do
            skip
        end
    end
end
