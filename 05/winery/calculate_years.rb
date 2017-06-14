require 'time'

module CalculateYears
  def years_old
    Time.now.year - date.partition('-')[0].to_i
  end
end
