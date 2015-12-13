class Notice < ActiveRecord::Base
  belongs_to :user

	def text_stripped
		Nokogiri::HTML(text).xpath("//text()").to_s
	end
end
