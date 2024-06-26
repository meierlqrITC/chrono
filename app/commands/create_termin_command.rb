class CreateTerminCommand
  def initialize(receiver, params)
    @receiver = receiver
    @params = params
  end

  def execute
    @receiver.create_termin(@params)
  end
end
