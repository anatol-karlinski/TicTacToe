require_relative '../Fuchsia/ManagerSceny.rb'
class Plansza
	attr_accessor :wysokosc, :szerokosc, :kolor, :kolorTla, :zawartosc
	def initialize(scena, szerokosc, wysokosc, kolor, kolorTla)
		@wysokosc = wysokosc
		@szerokosc = szerokosc
		@kolor = kolor
		@kolorTla = kolorTla
		@scena = scena
		@zawartosc = Array.new(3) {Array.new(3,'n')}
		RysujRamke()
		RysujPola()
	end
	def WprowadzWartoscNaPole(pole, wartosc)
		if (pole < 4) then
			@zawartosc[pole-1][0] = wartosc
		elsif (pole < 7) then 
			@zawartosc[pole-4][1] = wartosc
		else 
			@zawartosc[pole-7][2] = wartosc
		end
	end
	def WymazPlansze(pole)
		@zawartosc = Array.new(3) {Array.new(3,'n')}
		@pole = pole
		9.times do |i|
				@pole.UstawNaPole(i)
		end
	end
	def PodajWartoscPola(pole)
		if (pole < 3) then
			return @zawartosc[pole][0]
		elsif (pole < 6) then 
			return @zawartosc[pole-4][1]
		else 
			return @zawartosc[pole-7][2]
		end
	end
	def RysujPola
		2.times do |j|
			@scena.ekran.WstawZnak((@szerokosc/3).to_i*(j+1), 0, "╦", @kolor, @kolorTla)
			@scena.ekran.WstawZnak((@szerokosc/3).to_i*(j+1), @wysokosc, "╩", @kolor, @kolorTla)
			(@wysokosc-1).times do |i|
				@scena.ekran.WstawZnak((@szerokosc/3).to_i*(j+1), i+1, "║", @kolor, @kolorTla)
			end
		end
		2.times do |j|
			@scena.ekran.WstawZnak(0, (@wysokosc/3).to_i*(j+1), "╠", @kolor, @kolorTla)
			@scena.ekran.WstawZnak(@szerokosc, (@wysokosc/3).to_i*(j+1), "╣", @kolor, @kolorTla)
			(@szerokosc-1).times do |i|
				@scena.ekran.WstawZnak(i+1, (@wysokosc/3).to_i*(j+1), "═", @kolor, @kolorTla)
			end
		end
		2.times do |i|
			2.times do |j|
				@scena.ekran.WstawZnak((@szerokosc/3).to_i*(j+1), (@wysokosc/3).to_i*(i+1), "╬", @kolor, @kolorTla)
			end
		end		
	end
	def RysujRamke
		puts @wysokosc.to_s
		@scena.ekran.WstawZnak(0, 0, "╔", @kolor, @kolorTla)
	    @scena.ekran.WstawZnak(0, @wysokosc, "╚", @kolor, @kolorTla)
		@scena.ekran.WstawZnak(@szerokosc, 0, "╗", @kolor, @kolorTla)
		@scena.ekran.WstawZnak(@szerokosc, @wysokosc, "╝", @kolor, @kolorTla)
		(@szerokosc-1).times do |i|
			@scena.ekran.WstawZnak(i+1, @wysokosc, "═", @kolor, @kolorTla)
			@scena.ekran.WstawZnak(i+1, 0, "═", @kolor, @kolorTla)
		end
		(@wysokosc-1).times do |i|
			@scena.ekran.WstawZnak(0, i+1, "║", @kolor, @kolorTla)
			@scena.ekran.WstawZnak(@szerokosc, i+1, "║", @kolor, @kolorTla)
		end
	end
	private :RysujPola, :RysujRamke
end