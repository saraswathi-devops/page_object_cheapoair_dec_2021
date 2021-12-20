module UtilitiesModule
  def cal_date no_of_days
    (Time.now + 24 * 60 * 60 * no_of_days).strftime("%-d %B %Y")
  end
end