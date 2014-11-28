require_relative '../calendar'

# Desired Calendar API:
#   Calendar.for_week(4).of_month(8).in_year(2012).show # Weekly view
#   Calendar.for_month(6).in_year(2011).show            # Monthly view
#   Calendar.for_year(2014).show                        # Yearly view

describe Calendar do
    it "does not respond to class method new" do
        expect(Calendar).not_to respond_to(:new)
    end

    it "responds to class method for_week" do
        expect(Calendar).to respond_to(:for_week)
    end

    it "responds to class method of_month" do
        expect(Calendar).to respond_to(:of_month)
    end

    it "responds to class method for_month" do
        expect(Calendar).to respond_to(:for_month)
    end

    it "responds to class method in_year" do
        expect(Calendar).to respond_to(:in_year)
    end

    it "responds to class method for_year" do
        expect(Calendar).to respond_to(:for_year)
    end
end
