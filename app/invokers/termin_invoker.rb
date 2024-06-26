class TerminInvoker
  def initialize
    @commands = []
  end

  def store_and_execute(command)
    @commands << command
    command.execute
  end
end
