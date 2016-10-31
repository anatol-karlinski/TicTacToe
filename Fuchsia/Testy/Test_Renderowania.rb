require_relative '../ManagerSceny.rb'
require_relative 'Classes/KeypressManager.rb'
$scena = ManagerSceny.new
$szerokosc = 65
$wysokosc = 26
$scena.StworzScene()
$scena.ekran.UstawRozdzielczosc($szerokosc, $wysokosc)
$scena.ekran.UstawPrzesuniecie(18,3)

$scena.ekran.WstawZnak(0, 0, "╔", 'szary', 'czarny')
($szerokosc-1).times {|i| $scena.ekran.WstawZnak(i+1, 0, "═", 'szary','czarny')}
$scena.ekran.WstawZnak($szerokosc-1, 0, "╗", 'szary', 'czarny')
$scena.ekran.WstawZnak(0, $wysokosc-2, "╚", 'szary', 'czarny')
($szerokosc-1).times {|i| $scena.ekran.WstawZnak(i+1, $wysokosc-2, "═", 'szary','czarny')}
$scena.ekran.WstawZnak($szerokosc-1, $wysokosc-2, "╝", 'szary', 'czarny')
($wysokosc-3).times {|i| $scena.ekran.WstawZnak(0, i+1 , "║", 'szary','czarny')}
($wysokosc-3).times {|i| $scena.ekran.WstawZnak($szerokosc-1, i+1 , "║", 'szary','czarny')}
$scena.ekran.WstawWyraz($szerokosc/2-10, 0, "╣ by Anatol Karlinski ╠", 'szary','czarny')

class Pilka
	attr_accessor :polozenieX, :polozenieY, :wektorX, :wektorY, :tekstura, :kolorPilki, :kolorTla
	def initialize()
		@wektorX = 0
		@wektorY = 0
		@polozenieX = $szerokosc/2
		@polozenieY = ($wysokosc-2)/2
		@tekstura = "*"
		@kolorPilki = 'szary'
		@kolorTla = 'czarny'
	end

	def pojawPilke
		$scena.ekran.WstawZnak(@polozenieX, @polozenieY, @tekstura, @kolorPilki, @kolorTla)
	end

	def przemiescPilke
		$scena.ekran.WstawZnak(@polozenieX, @polozenieY, " ", @kolorTla, @kolorTla)
		@polozenieX = @polozenieX + @wektorX
		@polozenieY = @polozenieY + @wektorY
		$scena.ekran.WstawZnak(@polozenieX, @polozenieY, @tekstura, @kolorPilki, @kolorTla)
	end
end
$ballz = Array.new(1, Pilka.new)
$ballz.each do |pilka|
	pilka.polozenieX=10
	pilka.polozenieY=10
	wektor = Array.new(2)
	wektor = [1, 1]
	pilka.wektorX = wektor.sample
	pilka.wektorY = wektor.sample
	pilka.kolorPilki = 'szary'
	pilka.kolorTla = 'czarny'
	pilka.pojawPilke
end
$scena.ekran.WstawWyraz(17, 9, "████████╗███████╗███████╗████████╗", 'szary', 'czarny')
$scena.ekran.WstawWyraz(17, 10,"╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝", 'szary', 'czarny')
$scena.ekran.WstawWyraz(17, 11,"   ██║   █████╗  ███████╗   ██║   ", 'szary', 'czarny')
$scena.ekran.WstawWyraz(17, 12,"   ██║   ██╔══╝  ╚════██║   ██║   ", 'szary', 'czarny')
$scena.ekran.WstawWyraz(17, 13,"   ██║   ███████╗███████║   ██║   ", 'szary', 'czarny')
$scena.ekran.WstawWyraz(17, 14,"   ╚═╝   ╚══════╝╚══════╝   ╚═╝   ", 'szary', 'czarny')
$scena.WyswietlScene()

def renderuj
	$ballz.each do |pilka|
	  if pilka.polozenieY==$wysokosc-3 || pilka.polozenieY==1
	  		pilka.wektorY=pilka.wektorY*(-1)
	  elsif pilka.polozenieX == $szerokosc-2 || pilka.polozenieX==1
	  		pilka.wektorX=pilka.wektorX*(-1) 
	  end
	  if (pilka.polozenieY==15 || pilka.polozenieY==8) && pilka.polozenieX > 17 && pilka.polozenieX < 51
			pilka.wektorY=pilka.wektorY*(-1)
	  elsif (pilka.polozenieX==16 || pilka.polozenieX==51) && pilka.polozenieY > 9 && pilka.polozenieY < 14
	  		pilka.wektorX=pilka.wektorX*(-1) 
	  end
	end
	$ballz.each do |pilka|
	  pilka.przemiescPilke
end

$scena.WyswietlScene()
sleep(0.1)

end

renderuj while(true)