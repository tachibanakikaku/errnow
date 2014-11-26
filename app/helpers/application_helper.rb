module ApplicationHelper

  def date_format(time)
    time.strftime("%Y-%m-%d")
  end

  def time_format(time)
    time.strftime("%Y-%m-%d %H:%M:%S")
  end

end
