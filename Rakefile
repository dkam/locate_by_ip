task :grab_data do
  wget = `which wget`.strip
  wget = "/opt/local/bin/wget" if wget.length == 0 
  
	url = "http://mirrors.portafixe.com/ipinfodb/ip_database/current/ipinfodb_one_table_full.sql.bz2"
	puts [wget, url].join(" ")
	Kernel.system( [wget, url].join(" ") )
	puts "You should go and agree to the licence arrangements to use this data:"
	puts " http://ipinfodb.com/download.php?file=ipinfodb_one_table_full.sql.bz2"
	Kernel.system( `bunzip2 ipinfodb_one_table_full.sql.bz2`)
end

task :load_data do
  
end

