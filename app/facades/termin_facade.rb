class TerminFacade
  def initialize(user)
    @user = user
    @termin_manager = TerminManager.new
  end

  def create_termin(params)
    @termin_manager.create_termin(params)
  end

  def update_termin(termin, params)
    @termin_manager.update_termin(termin, params)
  end

  def delete_termin(termin)
    @termin_manager.delete_termin(termin)
  end
end
