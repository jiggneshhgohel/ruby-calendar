require_relative '../calendar'

describe Calendar do
    context "#date_today" do
        it "returns today's date" do
            calendar = Calendar.new
            expect(calendar.date_today).to eql(Time.now.day)
        end
    end
end
