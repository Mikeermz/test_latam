require_relative 'Sale.rb'

class Finland < Sale
	def initialize(producto, precio, fecha, latitud, longitud, ciudad, tipo_pago, nombre)
		super(producto,precio,fecha,latitud,longitud,ciudad,tipo_pago,nombre)
		@pais = "Finland"
	end


end
