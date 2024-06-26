class TerminVorschlag
  def initialize(strategy)
    @strategy = strategy
  end

  def generate
    @strategy.generate
  end
end
