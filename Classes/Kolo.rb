require_relative 'Pole.rb'
class Kolo < Pole
	def Rysuj(kolorZnakow, kolorTla)
		x, y = WyznaczPozycje(@pole)
		@scena.ekran.WstawWyraz(x+1, y+1, "O", kolorZnakow, kolorTla)
	end
end