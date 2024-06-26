class DeleteTerminCommand
  def initialize(receiver, termin)
    @receiver = receiver
    @termin = termin
  end

  def execute
    @receiver.delete_termin(@termin)
  end
end
