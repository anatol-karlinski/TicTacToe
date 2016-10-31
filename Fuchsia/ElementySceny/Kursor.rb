require_relative '../KlasyPomocnicze/ManagerKolorow.rb'
class Kursor
	attr_accessor :x, :y, :kolorCzcionki, :kolorTla
	def initialize
	    managerKolorow = ManagerKolorow.new
		@kolorCzcionki,@kolorTla = managerKolorow.UzyskajKolory('bialy', 'czarny')
		@x = 0
		@y = 0
		@wysokosc = 1;
		@szerokosc = 1;
 	end
 	def UstawKolor(kolorCzcionki, kolorTla)
 		managerKolorow = ManagerKolorow.new
 		@kolorCzcionki,@kolorTla = managerKolorow.UzyskajKolory(kolorCzcionki, kolorTla)
 	end
 	def PrzemiescNaPozycje(pozX, pozY)
		@x = pozX
		@y = pozY
 	end 
 	def PrzemiescOWektor(wektorX, wektorY)
		@x = @x + wektorX
		@y = @y + wektorY
 	end 
end