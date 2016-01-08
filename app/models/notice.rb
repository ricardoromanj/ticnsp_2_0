class Notice < ActiveRecord::Base
  belongs_to :user

	def text_stripped
		Nokogiri::HTML(text).xpath("//text()").to_s
	end

  def notice_type_color
    case notice_type
    when 'info'
      'teal'
    when 'warning'
      'orange'
    when 'success'
      'green'
    when 'danger'
      'red'
    end
  end
end
