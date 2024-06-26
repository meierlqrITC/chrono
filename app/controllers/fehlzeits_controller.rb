class FehlzeitsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_fehlzeit, only: %i[ show edit update destroy ]

  # GET /fehlzeits or /fehlzeits.json
  def index
    @fehlzeits = Fehlzeit.all
  end

  # GET /fehlzeits/1 or /fehlzeits/1.json
  def show
  end

  # GET /fehlzeits/new
  def new
    @fehlzeit = Fehlzeit.new
  end

  # GET /fehlzeits/1/edit
  def edit
  end

  # POST /fehlzeits or /fehlzeits.json
  def create
    @fehlzeit = Fehlzeit.new(fehlzeit_params)

    respond_to do |format|
      if @fehlzeit.save
        format.html { redirect_to fehlzeit_url(@fehlzeit), notice: "Fehlzeit was successfully created." }
        format.json { render :show, status: :created, location: @fehlzeit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fehlzeit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fehlzeits/1 or /fehlzeits/1.json
  def update
    respond_to do |format|
      if @fehlzeit.update(fehlzeit_params)
        format.html { redirect_to fehlzeit_url(@fehlzeit), notice: "Fehlzeit was successfully updated." }
        format.json { render :show, status: :ok, location: @fehlzeit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fehlzeit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fehlzeits/1 or /fehlzeits/1.json
  def destroy
    @fehlzeit.destroy!

    respond_to do |format|
      format.html { redirect_to fehlzeits_url, notice: "Fehlzeit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fehlzeit
      @fehlzeit = Fehlzeit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fehlzeit_params
      params.require(:fehlzeit).permit(:student_id, :veranstaltung_id, :datum, :begründung)
    end
end
