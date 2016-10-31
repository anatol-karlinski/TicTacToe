class Instrukcja
	def initialize(scena)
		@scena = scena
	end
	def Wyswietl(pozX, pozY)
		textInstrukcji =  
		[
			"┌──────┤ INSTRUKCJA ├──────┐",
			" ",
			" w,s,a,d - nawigacja",
			"  spacja - Wstawianie znaku",
			"       r - reset pola",
			" ",
			"        Gracz 1 - X",
			"        Gracz 2 - O",
			" ",
			"└──────────────────────────┘"
		]
		textInstrukcji.each_with_index do |text, i| 
			@scena.ekran.WstawWyraz(pozX, pozY+i, text, 'szary', 'czarny')
		end
	end
end