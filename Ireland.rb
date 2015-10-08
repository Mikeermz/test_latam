require_relative 'Sale.rb'

class Ireland < Sale
	def initialize(producto, precio, fecha, latitud, longitud, ciudad, tipo_pago, nombre)
		super(producto,precio,fecha,latitud,longitud,ciudad,tipo_pago,nombre)
		@pais = "Ireland"
	end
end