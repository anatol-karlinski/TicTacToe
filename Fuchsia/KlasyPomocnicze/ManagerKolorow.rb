class ManagerKolorow
	def UzyskajKolory(kolorCzcionki, kolorTla)
		return UzyskajKolorCzcionki(kolorCzcionki), UzyskajKolorTla(kolorTla)
	end
	def UzyskajKolorTla(kolorTla)
 		case kolorTla
			when 'czarny'   
				@kolorTla = 40
			when 'czerwony'	
				@kolorTla = 41
			when 'zielony'  
				@kolorTla = 42
			when 'brazowy'  
				@kolorTla = 43
			when 'niebieski'
				@kolorTla = 44
			when 'magenta'  
				@kolorTla = 45
			when 'cyan' 	
				@kolorTla = 46
			when 'szary'    
				@kolorTla = 47
			else 
				@kolorTla = 40
		end		
		return @kolorTla
	end
	def UzyskajKolorCzcionki(kolorCzcionki)
	 	case kolorCzcionki
			when 'czarny' 	
				@kolorCzcionki = 30
			when 'czerwony' 
				@kolorCzcionki = 31
			when 'zielony' 	
				@kolorCzcionki = 32
			when 'brazowy' 	
				@kolorCzcionki = 33
			when 'niebieski'
				@kolorCzcionki = 34
			when 'magenta'	
				@kolorCzcionki = 35
			when 'cyan'		
				@kolorCzcionki = 36
			when 'szary'	
				@kolorCzcionki = 37
			when 'bialy'	
				@kolorCzcionki = 01
			else 
				@kolorCzcionki = 01
		end
		return @kolorCzcionki	
	end
end