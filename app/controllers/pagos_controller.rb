class PagosController < ApplicationController
  before_action :set_pago, only: [:show, :edit, :update, :destroy]

  # GET /pagos
  # GET /pagos.json
  def index
    @pagos = Pago.all
  end

  # GET /pagos/1
  # GET /pagos/1.json
  def show
    @pago = Pago.find(params[:id])
  end

  def pago_prestamo
    prestamo_id = params[:id]
    @prestamo = Prestamo.find(prestamo_id)
    @estado_prestamo = ''
    if @prestamo.is_dispersado
      @estado_prestamo = 'Este prestamo ya ha sido dispersado'
    else
      @estado_prestamo = 'Este prestamo no ha sido dispersado'
    end
    @payments = Pago.where(prestamo_id: prestamo_id)

    # respond_to do |format|
    #   format.json { render :show, status: :created, location: @pagos_prestamo }
    # end
   
  end

  # GET /pagos/new
  def new
    @pago = Pago.new
  end

  # GET /pagos/1/edit
  def edit
  end

  # POST /pagos
  # POST /pagos.json
  def create
    @pago = Pago.new(pago_params)

    respond_to do |format|
      if @pago.save
        format.html { redirect_to @pago, notice: 'Pago was successfully created.' }
        format.json { render :show, status: :created, location: @pago }
      else
        format.html { render :new }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagos/1
  # PATCH/PUT /pagos/1.json
  def update
    respond_to do |format|
      if @pago.update(pago_params)
        format.html { redirect_to @pago, notice: 'Pago was successfully updated.' }
        format.json { render :show, status: :ok, location: @pago }
      else
        format.html { render :edit }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagos/1
  # DELETE /pagos/1.json
  def destroy
    @pago.destroy
    respond_to do |format|
      format.html { redirect_to pagos_url, notice: 'Pago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago
      @pago = Pago.find(params[:id])
    end

    def set_prestamo_pago
      @prestamos_pagos = Pago.find(params:[prestamo_id])
    end

    # Only allow a list of trusted parameters through.
    def pago_params
      params.require(:pago).permit(:prestamo_id, :pago_interes, :pago_monto_periodico, :pago_fecha, :pago_capital, :pago_prestamo_saldo, :pago_periodo)
    end
end
