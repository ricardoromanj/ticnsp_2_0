class Notice < ActiveRecord::Base
	def text_stripped
		Nokogiri::HTML(text).xpath("//text()").to_s
	end
end
