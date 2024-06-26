class AnwesenheitslistesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_anwesenheitsliste, only: %i[ show edit update destroy ]

  # GET /anwesenheitslistes or /anwesenheitslistes.json
  def index
    @anwesenheitslistes = Anwesenheitsliste.all
  end

  # GET /anwesenheitslistes/1 or /anwesenheitslistes/1.json
  def show
  end

  # GET /anwesenheitslistes/new
  def new
    @anwesenheitsliste = Anwesenheitsliste.new
  end

  # GET /anwesenheitslistes/1/edit
  def edit
  end

  # POST /anwesenheitslistes or /anwesenheitslistes.json
  def create
    @anwesenheitsliste = Anwesenheitsliste.new(anwesenheitsliste_params)

    respond_to do |format|
      if @anwesenheitsliste.save
        format.html { redirect_to anwesenheitsliste_url(@anwesenheitsliste), notice: "Anwesenheitsliste was successfully created." }
        format.json { render :show, status: :created, location: @anwesenheitsliste }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anwesenheitsliste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anwesenheitslistes/1 or /anwesenheitslistes/1.json
  def update
    respond_to do |format|
      if @anwesenheitsliste.update(anwesenheitsliste_params)
        format.html { redirect_to anwesenheitsliste_url(@anwesenheitsliste), notice: "Anwesenheitsliste was successfully updated." }
        format.json { render :show, status: :ok, location: @anwesenheitsliste }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anwesenheitsliste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anwesenheitslistes/1 or /anwesenheitslistes/1.json
  def destroy
    @anwesenheitsliste.destroy!

    respond_to do |format|
      format.html { redirect_to anwesenheitslistes_url, notice: "Anwesenheitsliste was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anwesenheitsliste
      @anwesenheitsliste = Anwesenheitsliste.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anwesenheitsliste_params
      params.require(:anwesenheitsliste).permit(:veranstaltung_id, :datum)
    end
end
