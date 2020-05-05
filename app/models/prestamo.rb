class Prestamo < ApplicationRecord
    validates :interes_prestamo, presence: true
    validates :plazo_prestamo, presence: true
    validates :monto_prestamo, presence: true
end
