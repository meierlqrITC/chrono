class TerminVorschlagStrategy
  def generate
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
