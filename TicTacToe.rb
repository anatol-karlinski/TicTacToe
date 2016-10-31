require_relative 'Fuchsia/ManagerSceny.rb'
require_relative 'Classes/Plansza.rb'
require_relative 'Classes/Wskaznik.rb'
require_relative 'Classes/Krzyz.rb'
require_relative 'Classes/Kolo.rb'
require_relative 'Classes/Pole.rb'
require_relative 'Classes/ManagerLogiki.rb'
require_relative 'Classes/KeypressManager.rb'
require_relative 'Classes/Instrukcja.rb'
def PrzygotujScene
	$gracz = 1
	$scena = ManagerSceny.new
	$scena.StworzScene()
	$scena.ekran.UstawRozdzielczosc(50,15)
	$scena.ekran.UstawPrzesuniecie(4,2)
	$scena.ekran.WymazZeZnakiem(" ")
	$plansza = Plansza.new($scena, 24, 12, 'bialy', 'czarny')
	$wskaznik = Wskaznik.new($scena, $plansza, 'cyan', 1)
	$wskaznik.UstawNaPole(5)
	$krzyz = Krzyz.new($scena, $plansza, 'bialy', 1)
	$kolo = Kolo.new($scena, $plansza, 'bialy', 2)
	$pustak = Pole.new($scena, $plansza, 'czarny', 1)
	$managerLogiki = ManagerLogiki.new($plansza)
	$instrukcja = Instrukcja.new($scena)
	$instrukcja.Wyswietl(28, 0)
	$scena.WyswietlScene()
end
def Renderuj
	c = read_char
	case c
	when "\u0003"
		puts "CONTROL-C"
		exit 0
	when "a" then
		if ($wskaznik.pole == 1 || $wskaznik.pole == 4 || $wskaznik.pole == 7)
			$wskaznik.UstawNaPole($wskaznik.pole + 2)
		else 
			$wskaznik.UstawNaPole($wskaznik.pole - 1)
		end
	when "d" then
		if ($wskaznik.pole == 3 || $wskaznik.pole == 6 || $wskaznik.pole == 9)
			$wskaznik.UstawNaPole($wskaznik.pole - 2)
		else
			$wskaznik.UstawNaPole($wskaznik.pole + 1)
		end
	when "w" then 
		if ($wskaznik.pole == 1 || $wskaznik.pole == 2 || $wskaznik.pole == 3)
			$wskaznik.UstawNaPole($wskaznik.pole + 6)
		else 
			$wskaznik.UstawNaPole($wskaznik.pole - 3)
		end
	when "s" then
		if ($wskaznik.pole == 7 || $wskaznik.pole == 8 || $wskaznik.pole == 9)
			$wskaznik.UstawNaPole($wskaznik.pole - 6)
		else
			$wskaznik.UstawNaPole($wskaznik.pole + 3)
		end
	when "r" then
			9.times do |i|
				$pustak.UstawNaPole(i+1)
			end
			$plansza.zawartosc = Array.new(3) {Array.new(3,'n')}
	when " " then
		if ($gracz == 1) then
			$krzyz.UstawNaPole($wskaznik.pole)
			$plansza.WprowadzWartoscNaPole($wskaznik.pole, 'x')
			$gracz = 2
		else
			$kolo.UstawNaPole($wskaznik.pole)
			$plansza.WprowadzWartoscNaPole($wskaznik.pole, 'o')	
			$gracz = 1
		end
  	end
	@flagaKonca, @rozwiazanie, @znak = $managerLogiki.SprawdzStanGry
	if @flagaKonca == 1 then
		if($gracz == 1) then $gracz = 2 else $gracz = 1 end 
		$scena.ekran.WstawWyraz(28, 11, "Koniec, wygrał Gracz " + $gracz.to_s + "!", 'szary', 'czarny')
		$scena.ekran.WstawWyraz(28, 12, "Wciśnij ENTER, aby zacząć od nowa.", 'szary', 'czarny')
		$scena.WyswietlScene()
		9.times do |i|
			$pustak.UstawNaPole(i+1)
		end
		$plansza.zawartosc = Array.new(3) {Array.new(3,'n')}
		$scena.ekran.WstawWyraz(28, 11, "Koniec, wygrał Gracz " + $gracz.to_s + "!", 'czarny', 'czarny')
		$scena.ekran.WstawWyraz(28, 12, "Wciśnij ENTER, aby zacząć od nowa.", 'czarny', 'czarny')
		gets
	end
	$scena.WyswietlScene()
end
PrzygotujScene()
Renderuj() while(true)