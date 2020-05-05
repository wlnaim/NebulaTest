class PrestamosController < ApplicationController
  before_action :set_prestamo, only: [:show, :edit, :update, :destroy]

  require 'helper_prestamo'
  require 'helper_dispersion'

  # GET /prestamos
  # GET /prestamos.json
  def index
    @prestamos = Prestamo.all.order(:created_at)
  end

  # GET /prestamos/1
  # GET /prestamos/1.json
  def show
    @prestamo = Prestamo.find(params[:id])
  end

  # GET /prestamos/new
  def new
    @prestamo = Prestamo.new
  end

  # GET /prestamos/1/edit
  def edit
  end

  # POST /prestamos
  # POST /prestamos.json
  def create
    #tomar datos del formulario
    montoPrestamo = params[:prestamo][:monto_prestamo]
    interesPrestamo = params[:prestamo][:interes_prestamo]
    periodoPrestamo = params[:prestamo][:plazo_prestamo]
    #hacer calculos
    montoPago = FinanceMath::Loan.new(nominal_rate: interesPrestamo, duration: periodoPrestamo, amount: montoPrestamo).pmt
    cantidadACubrir = montoPago.to_f.round().to_i * periodoPrestamo.to_f.round().to_i
    montoPago = montoPago.to_f.round().to_i
    #insertar prestamos
    @prestamo = Prestamo.new(monto_prestamo: montoPrestamo, interes_prestamo: interesPrestamo, plazo_prestamo: periodoPrestamo, 
    monto_cubrir_prestamo: cantidadACubrir, pago_periodico_prestamo: montoPago)

    respond_to do |format|
      if @prestamo.save
        #insertar pagos
        prestamo_helper = ::HelperPago.new(@prestamo)
        prestamo_helper.insertar_pagos()
        #retornar vista
        format.html { redirect_to prestamos_url, notice: 'El nuevo prestamo se ha registrado' }
        format.json { render :show, status: :created, location: @prestamo }
      else
        format.html { render :new }
        format.json { render json: @prestamo.errors, status: :unprocessable_entity }
      end
    end
  end

  def dispersar_prestamo
    @usuario = Usuario.new
  end

  # PATCH/PUT /prestamos/1
  # PATCH/PUT /prestamos/1.json
  def update
    respond_to do |format|
      if @prestamo.update(prestamo_params)
        format.html { redirect_to @prestamo, notice: 'Prestamo was successfully updated.' }
        format.json { render :show, status: :ok, location: @prestamo }
      else
        format.html { render :edit }
        format.json { render json: @prestamo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestamos/1
  # DELETE /prestamos/1.json
  def destroy
    @prestamo.destroy
    respond_to do |format|
      format.html { redirect_to prestamos_url, notice: 'Prestamo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestamo
      @prestamo = Prestamo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prestamo_params
      params.require(:prestamo).permit(:usuario_id, :plazo_prestamo, :interes_prestamo, :monto_prestamo, :monto_cubrir_prestamo, :pago_periodico_prestamo)
    end
end
