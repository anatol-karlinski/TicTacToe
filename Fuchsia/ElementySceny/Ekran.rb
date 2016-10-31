class Ekran 
	attr_accessor :nazwa, :szerokosc, :wysokosc, :zawartosc, :przesuniecieX, :przesuniecieY
	def initialize()
		@nazwa = 'ekran'
		@szerokosc = 1
  	@wysokosc = 1
  	@przesuniecieX = 0
  	@przesuniecieY = 0
  	@kursor = nil
  	@zawartosc = Array.new(@wysokosc) {Array.new(@szerokosc,' ')}
 	end
 	def UstawRozdzielczosc(szerokosc, wysokosc)
 		@szerokosc = szerokosc
 		@wysokosc = wysokosc
 		@zawartosc = Array.new(@wysokosc) {Array.new(@szerokosc,' ')}
 	end
 	def UstawPrzesuniecie(x, y)
 		@przesuniecieX = x
 		@przesuniecieY = y
 	end
 	def WymazZeZnakiem(znak)
 		@zawartosc = Array.new(@wysokosc) {Array.new(@szerokosc,znak.to_s)}
	end
 	def WstawZnak(x, y, znak, kolorCzcionki, kolorTla)
 		managerKolorow = ManagerKolorow.new
 		kolorCzcionki, kolorTla = managerKolorow.UzyskajKolory(kolorCzcionki, kolorTla)
 		@zawartosc[y][x] = znak.kolor(kolorCzcionki).kolorTla(kolorTla)
 	end
 	def WstawWyraz(x, y, wyraz, kolorCzcionki, kolorTla)
 		managerKolorow = ManagerKolorow.new
 		kolorCzcionki, kolorTla = managerKolorow.UzyskajKolory(kolorCzcionki, kolorTla)
 		i=x+1
 		wyraz.split("").each do |znak|
  			@zawartosc[y][i] = znak.kolor(kolorCzcionki).kolorTla(kolorTla)
  			i = i+1
		end
 	end
 	def DEBUG_EKRAN_RAPORT
    	"\n Scena: \n> nazwa: #{@nazwa} \n> wymiary: #{@szerokosc} x #{@wysokosc}"
  	end
end