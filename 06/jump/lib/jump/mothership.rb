class Mothership
  STARS = %w[
    Proxima\ Centauri
    Sirius
    GJ\ 1061
    SCR\ 1845-6357\ B
  ].freeze

  def compute
    STARS.sample
  end
end
