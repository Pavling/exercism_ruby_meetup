class Meetup

  def initialize(month, year)
    @month, @year = month, year
  end


  def first_date_by_day_after_monthday(year, month, monthday, weekday)
    date = Date.new(year, month, monthday)
    while date.wday != weekday
      date = date + 1
    end
    date
  end

  private
  def method_missing(method_name, *args, &block)
    case 
      when method_name.match(/^(mon|tues|wednes|thurs|fri|sat|sun)teenth$/)
        first_date_by_day_after_monthday(@year, @month, 12, which_day($1))
    else
      super
    end
  end

  private
  def which_day(day)
    {
      sun: 0,
      mon: 1,
      tues: 2,
      wednes: 3,
      thurs: 4,
      fri: 5,
      sat: 6,
    }[day.intern]
  end
end
