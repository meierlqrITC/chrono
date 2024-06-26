class TerminManager
  def create_termin(params)
    termin = Termin.new(params)
    if termin.save
      termin
    else
      raise StandardError.new(termin.errors.full_messages.to_sentence)
    end
  end

  def update_termin(termin, params)
    if termin.update(params)
      termin
    else
      raise StandardError.new(termin.errors.full_messages.to_sentence)
    end
  end

  def delete_termin(termin)
    termin.destroy
  end
end
