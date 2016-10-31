class String
	def kolor(num) 		"\e[#{num}m#{self}\e[0m" end
	def kolorTla(num) 	"\e[#{num}m#{self}\e[0m" end
	def kolory(num, num2) "\e[#{num}#{num2}m#{self}\e[0m" end

	def czarny;         "\e[00m#{self}\e[0m" end
	def czerwony;       "\e[01m#{self}\e[0m" end
	def zielony;        "\e[02m#{self}\e[0m" end
	def brazowy;        "\e[03m#{self}\e[0m" end
	def niebieski;      "\e[04m#{self}\e[0m" end
	def magenta;        "\e[05m#{self}\e[0m" end
	def cyan;           "\e[06m#{self}\e[0m" end
	def szary;          "\e[07m#{self}\e[0m" end

	def kolorTla_czarny;     "\e[40m#{self}\e[0m" end
	def kolorTla_czerowny;   "\e[41m#{self}\e[0m" end
	def kolorTla_zielony;    "\e[42m#{self}\e[0m" end
	def kolorTla_brazowy;    "\e[43m#{self}\e[0m" end
	def kolorTla_niebieski;  "\e[44m#{self}\e[0m" end
	def kolorTla_magenta;    "\e[45m#{self}\e[0m" end
	def kolorTla_cyan;     	"\e[46m#{self}\e[0m" end
	def kolorTla_szary;      "\e[47m#{self}\e[0m" end
	#Nie działa w lini komend :(
	def bold;           "\e[1m#{self}\e[22m" end
	def italic;         "\e[3m#{self}\e[23m" end
	def underline;      "\e[4m#{self}\e[24m" end
	def blink;          "\e[5m#{self}\e[25m" end
	def reverse_color;  "\e[7m#{self}\e[27m" end
end