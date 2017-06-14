require_relative 'calculate_years'

class User
  include CalculateYears

  attr_reader :date, :name

  def initialize(name, date_of_birth)
    @name = name
    @date = date_of_birth
  end
end
