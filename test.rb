test_str = "Long live the que.en!"
split1 = test_str.split(" ")

split1.each do |item|
	item_spl =  item.split("!")
	item_spl.each do |word|
		word_spl = word.split(".")
		word_spl.each do |word2|
			word2_spl = word2.split("-")
			puts word2_spl
		end
	end
end
