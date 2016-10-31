require_relative 'ElementySceny/Ekran.rb'
require_relative 'ElementySceny/Kursor.rb'
require_relative 'KlasyPomocnicze/ManagerKolorow.rb'
require_relative 'KlasyPomocnicze/String.rb'
class ManagerSceny
	attr_accessor :ekran, :kursor
	def StworzScene()
		raise ArgumentError, 'Scena już istnieje!' unless @ekran == nil
		@ekran = Ekran.new
	end
	def StworzKursor()
		raise ArgumentError, 'Na scenie moze istnieć tylko jeden kursor!' unless @kursor == nil  
		@kursor = Kursor.new
	end
	def WyswietlScene()
 		system "clear" or system "cls"
		@klatka = @ekran.zawartosc.map do |e| e.dup end
		if @kursor != nil
			@klatka[@kursor.y][@kursor.x] = @ekran.zawartosc[@kursor.y][@kursor.x].gsub(/\e\[(\d+)m/, '').kolor(@kursor.kolorCzcionki).kolorTla(@kursor.kolorTla)
 		end
 		@ekran.przesuniecieY.times { print "\n" }
 		@klatka.each do |sub|
 			@ekran.przesuniecieX.times { print " " }
  			sub.each do |pixel|
    			print pixel
  			end
  			puts "\n"
 		end
	end
end