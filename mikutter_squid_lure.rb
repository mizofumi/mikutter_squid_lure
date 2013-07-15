# -*- coding: utf-8 -*-

Plugin.create(:mikutter_squid_lured) do

stock = {}
stock['user'] = []
stock_end = rand(2..5)
character_str = "くコ:彡"
massage_str = "釣られたゲソ"

#反応対象のAA
str = "|\r\nし".gsub(/(\r\n|\r|\n)/, "")

	on_appear do |mess|
		mess.each do |mes|
			if str == mes.message.to_s.gsub(/(\r\n|\r|\n)/,"")
				#ストック開始
				stock['user'] << mes.user.to_s

				#ストック終了
				if (stock['user'].size > stock_end)
					screen_name = stock['user'].shuffle[0]

					#messageSquidStatus("#{screen_name}に釣られました")
					Service.primary.update(:message => "@#{screen_name}\r\n|\r\nし#{character_str} #{massage_str}")

					#リセット
					stock['user'] = {}
				end
				
			end
		end
	end

	def messageSquidStatus(mes)
		activity :system, mes
	end

end