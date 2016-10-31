class ManagerLogiki
	def initialize(plansza)
		@plansza = plansza
	end
	def SprawdzStanGry
		3.times do |pozY|
			3.times do |pozX|
				if @plansza.zawartosc[pozX][pozY] != 'n' then
					@pole = @plansza.zawartosc[pozX][pozY]
					if (@plansza.zawartosc[pozX][0] == @pole && 
						@plansza.zawartosc[pozX][1] == @pole && 
						@plansza.zawartosc[pozX][2] == @pole) then
							return 1, [[pozX, 0], [pozX, 1], [pozX, 2]], @pole
					elsif (@plansza.zawartosc[0][pozY] == @pole && 
						@plansza.zawartosc[1][pozY] == @pole && 
						@plansza.zawartosc[2][pozY] == @pole) then
							return 1, [[0, pozY], [0, pozY], [0, pozY]], @pole
					elsif (@plansza.zawartosc[0][0] == @pole && 
						@plansza.zawartosc[1][1] == @pole && 
						@plansza.zawartosc[2][2] == @pole) then 
							return 1, [[0, 0], [1, 1], [2, 2]], @pole
					elsif (@plansza.zawartosc[2][0] == @pole && 
						@plansza.zawartosc[1][1] == @pole && 
						@plansza.zawartosc[0][2] == @pole) then
							return 1, [[2, 0], [1, 1], [0, 2]], @pole
					end
				end
			end
		end
		return 0, [[],[],[]], "n"
	end
end