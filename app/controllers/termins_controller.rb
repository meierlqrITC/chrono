require_relative '../invokers/termin_invoker'

class TerminsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_termin, only: %i[ show edit update destroy ]
  before_action :set_veranstaltungen, only: %i[new edit create update]


  # GET /termins or /termins.json
  def index
    @termins = Termin.all
  end

  # GET /termins/1 or /termins/1.json
  def show
  end

  # GET /termins/new
  def new
    @termin = Termin.new
  end

  # GET /termins/1/edit
  def edit
  end

  # POST /termins or /termins.json
  def create
    @termin = Termin.new(termin_params)

    respond_to do |format|
      if @termin.save
        format.html { redirect_to termin_url(@termin), notice: "Termin erfolgreich angelegt." }
        format.json { render :show, status: :created, location: @termin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @termin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /termins/1 or /termins/1.json
  def update
    respond_to do |format|
      if @termin.update(termin_params)
        format.html { redirect_to termin_url(@termin), notice: "Termin aktualisiert" }
        format.json { render :show, status: :ok, location: @termin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @termin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /termins/1 or /termins/1.json
  def destroy
    @termin.destroy!

    respond_to do |format|
      format.html { redirect_to termins_url, notice: "Termin gelöscht." }
      format.json { head :no_content }
    end
  end

  def check
    exists = Termin.exists?(["(beginn <= ? AND ende >= ?)", params[:ende], params[:beginn]])
    if exists
      new_beginn, new_ende = find_alternative(params[:beginn], params[:ende])
      render json: { exists: exists, new_beginn: new_beginn, new_ende: new_ende }
    else
      render json: { exists: exists }
    end
  end

  private

  def find_alternative(beginn, ende)
    loop do
      new_beginn = (beginn.to_time + 5.days).strftime("%Y-%m-%dT%H:%M")
      new_ende = (ende.to_time + 5.days).strftime("%Y-%m-%dT%H:%M")
      break [new_beginn, new_ende] unless Termin.exists?(["(beginn <= ? AND ende >= ?)", new_ende, new_beginn])
      beginn = new_beginn
      ende = new_ende
    end
  end

  def set_termin
    @termin = Termin.find(params[:id])
  end

  def set_veranstaltungen
    @veranstaltungen = Veranstaltung.all
  end

    # Only allow a list of trusted parameters through.
    def termin_params
      params.require(:termin).permit(:bezeichnung, :beginn, :ende, :beschreibung, :veranstaltung_id)
    end
end
