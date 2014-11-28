require_relative '../calendar'
require_relative '../calendar_helper'

describe Calendar do
    include CalendarHelper

    context "#date_today" do
        it "returns today's date" do
            calendar = Calendar.new
            expect(calendar.date_today).to eql(monthday_number(current_datetime_object))
        end
    end

    context "#weekday_name_today" do
        it "returns today's week-day name" do
            calendar = Calendar.new
            expect(calendar.weekday_name_today).to eql(weekday_name(current_datetime_object))
        end
    end

    context "#weekday_number_today" do
        it "returns today's week-day number" do
            calendar = Calendar.new
            expect(calendar.weekday_number_today).to eql(weekday_number(current_datetime_object))
        end
    end

    context "#date_yesterday" do
        it "returns yesterday's date" do
            calendar = Calendar.new
            expect(calendar.date_yesterday).to eql(monthday_number(yesterday_datetime_object))
        end
    end

    context "#weekday_name_yesterday" do
        it "returns yesterday's week-day name" do
            calendar = Calendar.new
            expect(calendar.weekday_name_yesterday).to eql(weekday_name(yesterday_datetime_object))
        end
    end

    context "#weekday_number_yesterday" do
        it "returns yesterday's week-day number" do
            calendar = Calendar.new
            expect(calendar.weekday_number_yesterday).to eql(weekday_number(yesterday_datetime_object))
        end
    end

    context "#date_tomorrow" do
        it "returns tomorrow's date" do
            calendar = Calendar.new
            expect(calendar.date_tomorrow).to eql(monthday_number(tomorrow_datetime_object))
        end
    end

    context "#weekday_name_tomorrow" do
        it "returns tomorrow's week-day name" do
            calendar = Calendar.new
            expect(calendar.weekday_name_tomorrow).to eql(weekday_name(tomorrow_datetime_object))
        end
    end

    context "#weekday_number_tomorrow" do
        it "returns tomorrow's week-day number" do
            calendar = Calendar.new
            expect(calendar.weekday_number_tomorrow).to eql(weekday_number(tomorrow_datetime_object))
        end
    end
end
