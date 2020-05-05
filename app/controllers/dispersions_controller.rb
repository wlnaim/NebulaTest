class DispersionsController < ApplicationController
  before_action :set_dispersion, only: [:show, :edit, :update, :destroy]

  # GET /dispersions
  # GET /dispersions.json
  def index
    @dispersions = Dispersion.select("usuario_id, sum(cantidad) as cantidad").group("usuario_id")
  end

  def generar_dispersion
    usuario = Usuario.first()
    respond_to do |format|
      if usuario.cuenta_bancaria
        prestamo_dispersion = Prestamo.find_by(id: params["id"])
        if prestamo_dispersion and usuario
          #insertar pagos
          dispersion_helper = ::HelperDispersion.new
          dispersion_helper.insertar_dispersion(prestamo_dispersion.monto_prestamo, prestamo_dispersion.id, usuario.id)
          #update status prestamo
          prestamo_dispersion.update(is_dispersado: true)

          #retornar vista
          format.html { redirect_to prestamos_url, notice: 'La dispersión se ha realizado correctamente' }
          format.json { render :show, status: :created, location: prestamo_dispersion }
        else
          format.html { redirect_to prestamos_url, alert: 'Cuenta bancaria no válida' }
          format.json { render json: @prestamo_dispersion.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to usuarios_cuenta_bancaria_path, alert: 'Necesitas información en tu cuenta bancaria' }
        format.json { render :show, status: :created, location: prestamo_dispersion }
      end
    end
  end

  def historial_dispersion
    usuario_id = params[:id]
    @dispersiones = Dispersion.where(usuario_id: usuario_id)
  end

  # GET /dispersions/1
  # GET /dispersions/1.json
  def show
  end

  # GET /dispersions/new
  def new
    @dispersion = Dispersion.new
  end

  # GET /dispersions/1/edit
  def edit
  end

  # POST /dispersions
  # POST /dispersions.json
  def create
    @dispersion = Dispersion.new(dispersion_params)

    respond_to do |format|
      if @dispersion.save
        format.html { redirect_to @dispersion, notice: 'Dispersion was successfully created.' }
        format.json { render :show, status: :created, location: @dispersion }
      else
        format.html { render :new }
        format.json { render json: @dispersion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispersions/1
  # PATCH/PUT /dispersions/1.json
  def update
    respond_to do |format|
      if @dispersion.update(dispersion_params)
        format.html { redirect_to @dispersion, notice: 'Dispersion was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispersion }
      else
        format.html { render :edit }
        format.json { render json: @dispersion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispersions/1
  # DELETE /dispersions/1.json
  def destroy
    @dispersion.destroy
    respond_to do |format|
      format.html { redirect_to dispersions_url, notice: 'Dispersion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispersion
      @dispersion = Dispersion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dispersion_params
      params.require(:dispersion).permit(:usuario_id, :prestamo_id, :fechaalta, :cantidad)
    end
end
