class DispersionesController < ApplicationController
  before_action :set_dispersione, only: [:show, :edit, :update, :destroy]
  # GET /dispersiones
  # GET /dispersiones.json
  def index
    @dispersiones = Dispersione.all
  end

  # GET /dispersiones/1
  # GET /dispersiones/1.json
  def show
  end

  # GET /dispersiones/new
  def new
    @usuario = Usuario.new
    @dispersione = Dispersione.new
  end

  # GET /dispersiones/1/edit
  def edit
  end

  # POST /dispersiones
  # POST /dispersiones.json
  def create
    @dispersione = Dispersione.new(dispersione_params)

    respond_to do |format|
      if @dispersione.save
        format.html { redirect_to @dispersione, notice: 'Dispersione was successfully created.' }
        format.json { render :show, status: :created, location: @dispersione }
      else
        format.html { render :new }
        format.json { render json: @dispersione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispersiones/1
  # PATCH/PUT /dispersiones/1.json
  def update
    respond_to do |format|
      if @dispersione.update(dispersione_params)
        format.html { redirect_to @dispersione, notice: 'Dispersione was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispersione }
      else
        format.html { render :edit }
        format.json { render json: @dispersione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispersiones/1
  # DELETE /dispersiones/1.json
  def destroy
    @dispersione.destroy
    respond_to do |format|
      format.html { redirect_to dispersiones_url, notice: 'Dispersione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispersione
      @dispersione = Dispersione.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dispersione_params
      params.require(:dispersione).permit(:usuario_id, :prestamo_id, :fechaalta, :cantidad)
    end
end
