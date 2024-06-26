class UpdateTerminCommand
  def initialize(receiver, termin, params)
    @receiver = receiver
    @termin = termin
    @params = params
  end

  def execute
    @receiver.update_termin(@termin, @params)
  end
end
