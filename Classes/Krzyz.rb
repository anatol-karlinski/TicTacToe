require_relative 'Pole.rb'
class Krzyz < Pole
	def Rysuj(kolorZnakow, kolorTla)
		x, y = WyznaczPozycje(@pole)
		@scena.ekran.WstawWyraz(x+1, y+1, "X", kolorZnakow, kolorTla)
	end
end