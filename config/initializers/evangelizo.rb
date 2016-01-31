# NAME

# « Reader Evangelizo »

# SYNOPSIS

# http://feed.evangelizo.org/v2/reader.php [params...]
# RETURN VALUE

# The « Reader Evangelizo » script return a string with the content requested by "type" parameter 
# The returned string will be encoded as following :
# UTF-8                      for any param "lang"
# DESCRIPTION

# This manual page documents the « Reader Feed v2.0 » for EVANGELIZO.ORG. 
# With the « Reader Evangelizo » you can get all texts provided by evangelizo.org web service. The « Reader Evangelizo » will help you to display daily reading in your website, or saint of the day .. etc 
# The « Reader Evangelizo » is used as any PHP file on a website, with params like : file.php?param1=1&param2=2 
# PARAMETERS

# Usage : http://feed.evangelizo.org/v2/reader.php?param1=«value1»&param2=«value2»br /> 
# date	Must be formatted like YYYYMMDD. Can not exceed 30 days from today.

# type	Inform about what you want to get
#                     - « saint » : to get the saint of the day (with link to life)
#                     - « feast » : to get the feast of the day, if there is one (with link to explanation)
#                     - « litugic_t » : to get the liturgic title
#                     - « reading_lt » : to get the long title of the reading
#                     - « reading_st » : to get the short title of the reading
#                     - « reading » : to get the text of the reading
#                     - « all » : to get all the readings of the day
#                     - « comment_t » : to get the title of the commentary
#                     - « comment_a » : to get the author of the commentary
#                     - « comment_s » : to get the source of the commentary
#                     - « comment » : to get the text of the commentary

# lang	Tells the language to display and the liturgical calendar to use
#           for Roman calendar Ordinary form : 
#                     - « AM » : for american-us language and Roman calendar Ordinary form
#                     - « AR » : for arabic language and Roman calendar Ordinary form
#                     - « DE » : for german language and Roman calendar Ordinary form
#                     - « FR » : for french language and Roman calendar Ordinary form
#                     - « GR » : for greek (hellenic) language and Roman calendar Ordinary form
#                     - « IT » : for italian language and Roman calendar Ordinary form
#                     - « MG » : for malagasy language and Roman calendar Ordinary form
#                     - « NL » : for dutch language and Roman calendar Ordinary form
#                     - « PL » : for polish language and Roman calendar Ordinary form
#                     - « PT » : for portuges language and Roman calendar Ordinary form
#                     - « SP » : for spanish language and Roman calendar Ordinary form
#           for other catholics calendars forms : 
#                     - « ARM » : for armenian language and armenian calendar
#                     - « BYA » : for arabic language and byzantine calendar
#                     - « MAA » : for arabic language and maronite calendar
#                     - « TRF » : for french language and Roman extraordinary calendar
#                     - « TRA » : for american-us language and Roman extraordinary calendar

# content	Tells the lecture you want to get
#           for Roman calendar Ordinary form : 
#                     - « FR » : for the first lecture
#                     - « PS » : for the psalm
#                     - « SR » : for the second lecture
#                     - « GSP » : for the gospel
#           for other catholics calendars forms : 
#                     - « EP » : for the epistle
#                     - « GSP » : for the gospel

# EXAMPLES

#  	 	type	date	lang	content	url example
# To get the saint of a day	 	saint	yyyymmdd	Ordinary forms
# AM, AR, DE, FR,
# GR, IT, NL, PL,
# PT, SP


# Other forms
# ARM, BYA, MAA,
# TRF, TRA	Ordinary forms
#  FR,PS,SR,GSP



# Other forms
# EP,GSP	http://feed.evangelizo.org/v2/reader.php?date=20151111&type=saint&lang=IT
# To get the feast of a day	 	feast	http://feed.evangelizo.org/v2/reader.php?date=20151111&type=feast&lang=AM
# To get the liturgic title of a day	 all 	liturgic_t	http://feed.evangelizo.org/v2/reader.php?date=20151111&type=liturgic_t&lang=FR
# To get the long reading title of a day	reading_lt	http://feed.evangelizo.org/v2/reader.php?date=20151111&type=reading_lt&lang=SP&content=FR
# To get the short reading title of a day	reading_st	http://feed.evangelizo.org/v2/reader.php?date=20151111&type=reading_st&lang=TRF&content=EP
# To get the text of the reading of a day	reading	http://feed.evangelizo.org/v2/reader.php?date=20151111&type=reading&lang=DE&content=GSP
# To get the commentary title of a day	 	comment_t	http://feed.evangelizo.org/v2/reader.php?date=20151111&type=comment_t&lang=PT
# To get the commentary author of a day	 	comment_a	http://feed.evangelizo.org/v2/reader.php?date=20151111&type=comment_a&lang=FR
# To get the commentary source of a day	 	comment_s	http://feed.evangelizo.org/v2/reader.php?date=20151111&type=comment_s&lang=PL
# To get the commentary text of a day	 	comment	http://feed.evangelizo.org/v2/reader.php?date=20151111&type=comment&lang=MAA


# PHP example
#    $today = date('Ymd');
#    $url = "http://feed.evangelizo.org/v2/reader.php?date=$today&type=comment&lang=FR";
#    $h = fopen($url,"r");
#    while (!feof($h)) {
#      $str .= fgets($h);
#    }
#    print $str;

# Javascript example 1

#    <html> 
#    <head> 
#      <title>Exemple d'affichage de fichier texte</title> 
#      <script language="javascript" type="text/javascript"> 
#        function displayTextFile(filePath){ 
#          iframe = document.getElementsByName('textDisplay')[0]; 
#          iframe.src=filePath; 
#          iframe.style.display="block"; 
#        } 
#      </script> 
#    </head> 
#    <body> 
#      <iframe id="textDisplay" name="textDisplay" src="" style="width: 400px; height: 240px; display: none;"></iframe> 
#      <script> 
#        var currentTime = new Date(); 
#        var month = currentTime.getMonth() + 1; 
#        var day = currentTime.getDate(); 
#        var year = currentTime.getFullYear(); 
#        if (day < 10) day = '0'+day; 
#        if (month < 10) month = '0'+month; 
#        displayTextFile('http://feed.evangelizo.org/v2/reader.php?date='+year+month+day+'&type=reading&lang=FR&content=GSP'); 
#      </script> 
#    </body> 
#    </html> 




# Test it online !

# What:  Date:  Lang:  Content (optional):   Submit
require 'curl'

module Evangelizo

  class Reading

    def self.title( date, lang, content, short=false )
      begin
        http = Curl.get("http://feed.evangelizo.org/v2/reader.php?date=#{ date }&type=reading_#{ ( short ? 'st' : 'lt' ) }&lang=#{ lang }&content=#{ content }")
        return http.body_str.force_encoding( 'UTF-8' ).split( "<br /><br />" ).first
      rescue Curl::Err::HostResolutionError
        return "No disponible"
      end
    end

    def self.reading( date, lang, content )
      begin
        http = Curl.get("http://feed.evangelizo.org/v2/reader.php?date=#{ date }&type=reading&lang=#{ lang }&content=#{ content }")
        return http.body_str.force_encoding( 'UTF-8' ).split( "<br /><br />" ).first
      rescue Curl::Err::HostResolutionError
        return "No se pudo recuperar esta lectura"
      end
    end

    def self.daypack( date, lang )
      daypack_result = Rails.cache.fetch( "daypack_#{ date }_#{ lang }", expires_in: 5.days ) do
        daypack = []

        # Get first reading
        daypack << { title: title( date, lang, 'FR' ), reading: reading( date, lang, 'FR' ) }

        # Check if we got no error
        if daypack.first[:title] =~ /^<font color=red><b>Error/
          daypack = [ { title: 'No hay información. Elige una fecha a no más de 30 días de la fecha actual.', reading: '' } ]
        else

          # For the second reading, we need validation
          second_reading = { title: title( date, lang, 'SR' ), reading: reading( date, lang, 'SR' ) }
          unless second_reading[:title] == " <font dir=\"ltr\"></font>\n"
            daypack << second_reading
          end

          # Get the Gospel
          daypack << { title: title( date, lang, 'GSP' ), reading: reading( date, lang, 'GSP' ) }

        end

        daypack
      end
      return daypack_result
    end

  end

  class Feast

    def self.get( date, lang )
      begin
        http = Curl.get("http://feed.evangelizo.org/v2/reader.php?date=#{ date }&type=feast&lang=#{ lang }")
        return http.body_str.force_encoding( 'UTF-8' ).split( "<br /><br />" ).first
      rescue Curl::Err::HostResolutionError
        return "No disponible"
      end
    end

  end

  class Saint

    def self.get( date, lang )
      begin
        http = Curl.get("http://feed.evangelizo.org/v2/reader.php?date=#{ date }&type=saint&lang=#{ lang }")
        return http.body_str.force_encoding( 'UTF-8' ).split( "<br /><br />" ).first
      rescue Curl::Err::HostResolutionError
        return "No disponible"
      end
    end

  end

end


