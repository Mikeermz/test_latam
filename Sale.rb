require "pp"
require "csv"

class Sale 
  attr_accessor :producto, :precio, :fecha, :latitud, :longitud, :ciudad, :tipo_pago, :nombre, :pais

  @@sales = []

  def initialize(producto, precio, fecha, latitud, longitud, ciudad, tipo_pago, nombre)
  	@producto = producto
  	@precio = precio
  	@fecha = fecha
  	@latitud = latitud
  	@longitud = longitud
  	@ciudad = ciudad
  	@tipo_pago = tipo_pago
  	@nombre = nombre
  	@pais = "Otro"
  	@@sales << self
  end

  def self.all
  	@@sales
  
  end

  def to_s
  	"#{@fecha}, #{@precio}, #{@producto}"

  end

  def to_geo
  	"(#{@latitud}, #{@longitud})"
  end


  def self.sin_repetecion(pais)
  	a = Sale.all.select{ |p| p.pais == pais }
  	b = []
  	a.each do |c|  
  		b << c.ciudad unless b.include?(c.ciudad)
  	end
  	b
  end

  def self.mastercard
  	Sale.all.select{ |m| m.tipo_pago == "Mastercard"}.count
  end

  def self.suma(tipo_pago)
  	a = Sale.all.select{ |p| p.tipo_pago == tipo_pago}
  	b = []
  	a.each do |c|  
  		b << c.nombre unless b.include?(c.nombre)
  	end
  	
  end

  def self.sumatoria(producto)
  	a = Sale.all.select{ |p| p.producto = producto}
  	total = 0
	i = 1
	while  (a[i]) do
	total += a[i]
	i += 1
	end
	puts "sumatoria: #{total}"	
  	
  end
  def self.sumatoria2(producto, pais)
  	suma = Sale.all.select{|x| x.producto = producto && x.pais = pais}
  	total = suma.inject(0){ |x, y| x += y.precio }
  	puts "#{suma.count} transacciones para #{producto} en #{pais}  con el total de #{total}"
  	
  end

end

