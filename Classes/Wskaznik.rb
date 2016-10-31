class Wskaznik
	attr_accessor :pozX, :pozY, :pole
	def initialize(scena, plansza, kolor, pole = 1)
		@pole = pole
		@scena = scena
		@plansza = plansza
		@kolor = kolor
		@wysokoscPola = (@plansza.wysokosc - 4)/3
		@szerokoscPola = (@plansza.szerokosc - 4)/3
	end
	def UstawNaPole(pole)
		Rysuj('czarny', 'czarny')
		@pole = pole
		Rysuj(@kolor, 'czarny')
	end
	def Rysuj(kolorZnakow, kolorTla)
		x, y = WyznaczPozycje(@pole)
		@scena.ekran.WstawZnak(x, y, "╔", kolorZnakow, kolorTla)
		@scena.ekran.WstawZnak(x+@szerokoscPola, y, "╗", kolorZnakow, kolorTla)
		@scena.ekran.WstawZnak(x, y+@wysokoscPola, "╚", kolorZnakow, kolorTla)
		@scena.ekran.WstawZnak(x+@szerokoscPola, y+@wysokoscPola, "╝", kolorZnakow, kolorTla)
	end
	def WyznaczPozycje(pole)
		if(pole <= 3)
			return (@plansza.szerokosc/3)*(pole-1)+1, 1
		elsif(pole <= 6)
			return @plansza.szerokosc/3*(pole-4)+1, @plansza.wysokosc/3+1
		else
			return @plansza.szerokosc/3*(pole-7)+1, @plansza.wysokosc/3*2+1
		end
	end
	private :Rysuj, :WyznaczPozycje
end