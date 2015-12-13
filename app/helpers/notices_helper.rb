module NoticesHelper
  def notice_author( author )
    if author.usertype =~ /admin/
      "Administrador"
    else
      author.full_name
    end
  end
end
