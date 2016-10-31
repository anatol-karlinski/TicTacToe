require_relative '../ManagerSceny.rb'
require_relative 'Classes/KeypressManager.rb'
def PrzygotujScene
	$kolory = ["czerwony", "zielony", "brazowy", "niebieski", "magenta", "cyan", "szary", "bialy"]
	$scena = ManagerSceny.new
	$scena.StworzScene()
	$scena.ekran.UstawRozdzielczosc(50,15)
	$scena.ekran.UstawPrzesuniecie(24,8)
	$scena.ekran.WymazZeZnakiem(" ")
	$scena.StworzKursor()
	$scena.kursor.UstawKolor('czarny', 'szary')
	$scena.ekran.WstawZnak(2, 1, "╔", 'cyan', 'czarny')
	for i in 3..47
	    $scena.ekran.WstawZnak(i, 1, "═", 'cyan', 'czarny')
	end
	$scena.ekran.WstawZnak(47, 1, "╗", 'cyan', 'czarny')
	for i in 2..7
	    $scena.ekran.WstawZnak(47, i, "║", 'cyan', 'czarny')
	    $scena.ekran.WstawZnak(2, i, "║", 'cyan', 'czarny')
	end
	$scena.ekran.WstawZnak(2, 8, "╚", 'cyan', 'czarny')
	for i in 3..46
	    $scena.ekran.WstawZnak(i, 8, "═", 'cyan', 'czarny')
	end
	$scena.ekran.WstawZnak(47, 8, "╝", 'cyan', 'czarny')
	$scena.ekran.WstawWyraz(15, 2, "███ TEST KURSORA ███", 'zielony','czarny')
	$scena.ekran.WstawWyraz(15, 5, "STEROWANIE - W,S,A,D", 'brazowy','czarny')
	$scena.ekran.WstawWyraz(14, 8, "╣ by Anatol Karlinski ╠", 'cyan','czarny')
	$scena.WyswietlScene()
end
def Renderuj
    c = read_char
  case c
  when "w"
  	if($scena.kursor.y > 0)
	  	$scena.kursor.PrzemiescOWektor(0,-1)
	end
  when "s"
  	if($scena.kursor.y < $scena.ekran.wysokosc-1)
  		$scena.kursor.PrzemiescOWektor(0,1)
  	end
  when "a"
  	if($scena.kursor.x > 0)
  		$scena.kursor.PrzemiescOWektor(-1,0)
  	end
  when "d"
  	if($scena.kursor.x < $scena.ekran.szerokosc-1)
  		$scena.kursor.PrzemiescOWektor(1,0)
  	end
  when "\u0003"
    puts "CONTROL-C"
    exit 0
  else 
	$scena.ekran.WstawZnak($scena.kursor.x, $scena.kursor.y , c, $kolory.sample(1).at(0), 'czarny')
	if( $scena.kursor.x < $scena.ekran.szerokosc - 1 )
  		$scena.kursor.PrzemiescOWektor(1,0)
  	elsif( $scena.kursor.y+1 < $scena.ekran.wysokosc )
  		$scena.kursor.PrzemiescNaPozycje(0, $scena.kursor.y+1)
  	end
  end
  $scena.WyswietlScene()
end
PrzygotujScene()
Renderuj() while(true)