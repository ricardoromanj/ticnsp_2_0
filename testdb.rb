require './config/environment.rb'

ActiveRecord::Base.establish_connection
con = ActiveRecord::Base.establish_connection

if con.connected?
  exit(0)
elsif
  exit(100)
end
