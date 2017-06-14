require_relative 'calculate_years'

class Winery
  include CalculateYears

  attr_reader :date, :title

  def initialize(title, date_of_foundation)
    @title = title
    @date = date_of_foundation
  end
end
