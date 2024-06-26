class VeranstaltungsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_veranstaltung, only: %i[ show edit update destroy ]
  before_action :set_module, only: %i[new edit create update]


  # GET /veranstaltungs or /veranstaltungs.json
  def index
    @veranstaltungs = Veranstaltung.all
  end

  # GET /veranstaltungs/1 or /veranstaltungs/1.json
  def show
  end

  # GET /veranstaltungs/new
  def new
    @veranstaltung = Veranstaltung.new
  end

  # GET /veranstaltungs/1/edit
  def edit
  end

  # POST /veranstaltungs or /veranstaltungs.json
  def create
    @veranstaltung = Veranstaltung.new(veranstaltung_params)

    respond_to do |format|
      if @veranstaltung.save
        format.html { redirect_to veranstaltung_url(@veranstaltung), notice: "Veranstaltung erfolgreich erstellt." }
        format.json { render :show, status: :created, location: @veranstaltung }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @veranstaltung.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veranstaltungs/1 or /veranstaltungs/1.json
  def update
    respond_to do |format|
      if @veranstaltung.update(veranstaltung_params)
        format.html { redirect_to veranstaltung_url(@veranstaltung), notice: "Veranstaltung was successfully updated." }
        format.json { render :show, status: :ok, location: @veranstaltung }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @veranstaltung.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veranstaltungs/1 or /veranstaltungs/1.json
  def destroy
    @veranstaltung.destroy!

    respond_to do |format|
      format.html { redirect_to veranstaltungs_url, notice: "Veranstaltung was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veranstaltung
      @veranstaltung = Veranstaltung.find(params[:id])
    end

  def set_module
    @module = Modul.all
  end

    # Only allow a list of trusted parameters through.
    def veranstaltung_params
      params.require(:veranstaltung).permit(:name, :datum, :beschreibung, :modul_id)
    end
end
