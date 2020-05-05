module  Services
    class PagoHelper

        def initialize(prestamo)
            @prestamo = prestamo
        end

        def insertar_pagos()
            monto_pago_periodico = @prestamo.pago_periodico_prestamo
            fechaActual = Time.now
      
            limit = @prestamo.plazo_prestamo
            monto_variable = @prestamo.monto_prestamo

            for i in 1..limit       
              interes_prestamo = calcular_interes(monto_variable, @prestamo.interes_prestamo, @prestamo.plazo_prestamo)
              pago_numero = i
              pago_monto = monto_pago_periodico - interes_prestamo
              monto_variable -= pago_monto 
      
              insert_pago(@prestamo.id, pago_numero, monto_pago_periodico, interes_prestamo, pago_monto, fechaActual, monto_variable)
              @pago.save
            end
        end
      
        
        def insert_pago(prestamo_id, pago_numero, pago_periodico, pago_interes, pago_monto, pago_fecha, monto_variable)
           @pago = Pago.new(prestamo_id: prestamo_id, pago_periodo: pago_numero, pago_monto_periodico: pago_periodico, pago_capital: pago_monto, pago_fecha: pago_fecha, pago_interes: pago_interes, pago_prestamo_saldo: monto_variable)
        end
      
        #this method must be private, it is only available inside tihs class
        def calcular_interes(monto_prestamo, tasa_interes, periodo)
            interes = (monto_prestamo * (tasa_interes /100) ) / periodo
            interes = interes.round().to_i
            return interes
        end
    end
end