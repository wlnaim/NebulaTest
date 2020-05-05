require 'rails_helper'

RSpec.describe Prestamo, type: :model do

  subject { Prestamo.new }

  

  context 'ejecución de pruebas: ' do
    it 'agregar nuevo registro' do
      subject.interes_prestamo        = 10
      subject.plazo_prestamo          = 12
      subject.monto_prestamo          = 100000
      expect(subject).to be_valid
    end

    it 'verificación de campos' do
    interes_prestamo        = 10
    plazo_prestamo          = 12
    monto_prestamo          = 100000
    is_dispersado           = false
    pago_periodico_prestamo = FinanceMath::Loan.new(nominal_rate: interes_prestamo, duration: plazo_prestamo, amount: monto_prestamo).pmt.to_i
    monto_cubrir_prestamo   = interes_prestamo * pago_periodico_prestamo
    expect(interes_prestamo * pago_periodico_prestamo).to eq(monto_cubrir_prestamo)
    end
  end

  

  it 'simulación descuento de prestamo' do
    interes_prestamo        = 10
    plazo_prestamo          = 12
    monto_prestamo          = 10000
    pago_periodico_prestamo = FinanceMath::Loan.new(nominal_rate: interes_prestamo, duration: plazo_prestamo, amount: monto_prestamo).pmt.round(2)
    monto_variable = monto_prestamo

    for i in 1..plazo_prestamo
      interes_cantidad =   (((monto_variable *  (interes_prestamo.to_f) /100.0 ) ) /12).round(2)
      pago_monto = pago_periodico_prestamo - interes_cantidad
      monto_variable -= pago_monto
    end
    expect(monto_variable.round(2).to_i).to eq(0)
  end

end
