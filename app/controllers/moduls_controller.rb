class ModulsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_modul, only: %i[ show edit update destroy ]

  # GET /moduls or /moduls.json
  def index
    @moduls = Modul.all
  end

  # GET /moduls/1 or /moduls/1.json
  def show
  end

  # GET /moduls/new
  def new
    @modul = Modul.new
  end

  # GET /moduls/1/edit
  def edit
  end

  # POST /moduls or /moduls.json
  def create
    @modul = Modul.new(modul_params)

    respond_to do |format|
      if @modul.save
        format.html { redirect_to modul_url(@modul), notice: "Modul was successfully created." }
        format.json { render :show, status: :created, location: @modul }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @modul.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moduls/1 or /moduls/1.json
  def update
    respond_to do |format|
      if @modul.update(modul_params)
        format.html { redirect_to modul_url(@modul), notice: "Modul was successfully updated." }
        format.json { render :show, status: :ok, location: @modul }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @modul.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moduls/1 or /moduls/1.json
  def destroy
    @modul.destroy!

    respond_to do |format|
      format.html { redirect_to moduls_url, notice: "Modul was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modul
      @modul = Modul.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def modul_params
      params.require(:modul).permit(:name, :beschreibung)
    end
end
