require_relative '../calendar'

describe Calendar do
    context "#date_today" do
        it "returns today's date" do
            calendar = Calendar.new
            expect(calendar.date_today).to eql(Time.now.day)
        end
    end

    context "#week_day_name_today" do
        it "returns today's week day name" do
            calendar = Calendar.new
            expect(calendar.week_day_name_today).to eql(Time.now.strftime('%A'))
        end
    end

    context "#week_day_number_today" do
        it "returns today's week day number" do
            calendar = Calendar.new
            expect(calendar.week_day_number_today).to eql(Time.now.wday)
        end
    end

    context "#date_yesterday" do
        it "returns yesterday's date" do
            calendar = Calendar.new
            expect(calendar.date_yesterday).to eql( (Time.now - (1 * 60 * 60 * 24 )).day )
        end
    end

    context "#next_week_dates" do
        it "returns an array of dates in next week" do
            skip
        end
    end
end
