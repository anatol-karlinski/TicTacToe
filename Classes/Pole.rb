class Pole
	attr_accessor :pole, :wysokoscPola, :szerokoscPola
	def initialize(scena, plansza, kolor, pole = 1)
		@kolor = kolor
		@scena = scena
		@plansza = plansza
		@pole = pole
		@wysokoscPola = (@plansza.wysokosc - 4)/3
		@szerokoscPola = (@plansza.szerokosc - 4)/3
	end
	def UstawNaPole(pole)
		@pole = pole
		Rysuj(@kolor, 'czarny')
	end
	def Rysuj(kolorZnakow, kolorTla)
		x, y = WyznaczPozycje(@pole)
		@scena.ekran.WstawWyraz(x+1, y+1, "X", kolorZnakow, kolorTla)
	end
	def WyznaczPozycje(pole)
		if(pole < 4)
			return (@plansza.szerokosc/3)*(pole-1)+2, 1
		elsif(pole < 7)
			return @plansza.szerokosc/3*(pole-4)+2, @plansza.wysokosc/3+1
		else
			return @plansza.szerokosc/3*(pole-7)+2, @plansza.wysokosc/3*2+1
		end
	end
	private :WyznaczPozycje, :Rysuj
end