# encoding: utf-8

#music automat
require 'debugger'

class MusicBox

	def initialize song_cost
		@song = ['песня № 1', 'песня № 2', 'песня № 3', 'песня № 4', 'песня № 5']
		@song_cost = song_cost
		@current_song = ''
		@turned_on = false
	end

	def turn_on
		unless @turned_on
		  @turned_on = true
		  puts "Box was turned on" 
		end
	end

	def turn_off
		if @turned_on
     	  puts "Box was turned on"
      	  @turned_on = false
   		 else
          puts "Box was turned off"
    	end
	end

	def pay income_money

		if income_money.to_i >= @song_cost.to_i
			p 'На вашем счете ' + income_money.to_s + ' рублей. Вы можете заказать ' + (income_money.to_i / @song_cost.to_i).to_s + ' Песен! '
		end

		while income_money.to_i < @song_cost.to_i
			p 'Внесенных вами средств недостаточно! Для заказа одной песни Вам нехватает ' + (@song_cost.to_i - income_money.to_i).to_s + ' рублей'
			re_incom_money = gets.chomp
			income_money = income_money.to_i + re_incom_money.to_i
			if income_money.to_i >= 10
				p 'На вашем счете ' + income_money.to_s + ' рублей. Вы можете заказать ' + (income_money.to_i / @song_cost.to_i).to_s + ' Песен! '
			end
			
		end

		if income_money.to_i > 100
			p 'Максимальный платеж 100 рублей'
		end

	end

	def list_song
		puts @song
	end

	def search song_number
		@current_song = @song[song_number.to_i - 1]
	end

	def load_song
		p 'Вы выбрали песню ' + (@song[@current_song.to_i]).to_s + ' '
		p 'Загрузка...'
	end

	def play_music
		puts 'Играет '+ (@song[@current_song.to_i]).to_s + ' !'
	end

	def status
		if @turned_on
			p "Turned on"
		else
			p "Turned off"
		end
	end

end


box = MusicBox.new 10
  box.turn_on
  box.status
  puts
    p 'Стоимсоть одной песни 10 рублей'
    p 'Внесите средства, затем выберете песню'
    income_money = gets.chomp

  box.pay income_money

  box.list_song
  p 'Укажите номер песни'
  song_number = gets.chomp
  box.search song_number
  box.load_song
  box.play_music