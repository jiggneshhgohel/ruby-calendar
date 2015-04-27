A Calendar Utility PORO (plain old ruby object).

### Example Usage:

```
> Calendar.for_week(4).of_month(8).in_year(2012).show
{:wed=>22, :thu=>23, :fri=>24, :sat=>25, :sun=>26, :mon=>27, :tue=>28}

> Calendar.for_month(6).in_year(2011).show
{:mon=>[6, 13, 20, 27], :tue=>[7, 14, 21, 28], :wed=>[1, 8, 15, 22, 29], :thu=>[2, 9, 16, 23, 30], :fri=>[3, 10, 17, 24], :sat=>[4, 11, 18, 25], :sun=>[5, 12, 19, 26]}

> Calendar.for_current_week.show
{:wed=>22, :thu=>23, :fri=>24, :sat=>25, :sun=>26, :mon=>27, :tue=>28}

> Calendar.for_current_month.show
{:mon=>[6, 13, 20, 27], :tue=>[7, 14, 21, 28], :wed=>[1, 8, 15, 22, 29], :thu=>[2, 9, 16, 23, 30], :fri=>[3, 10, 17, 24], :sat=>[4, 11, 18, 25], :sun=>[5, 12, 19, 26]}

> Calendar.for_week(4).show
/home/jignesh/ruby-calendar/calendar.rb:64:in `validate_object_state': Incorrect API Usage.Required month and year components missing. (RuntimeError)
	from /home/jignesh/ruby-calendar/calendar.rb:33:in `show'
	from examples/demo.rb:24:in `<main>'
```

Please refer the rspecs for more details on the available methods.
