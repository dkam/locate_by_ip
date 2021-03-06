require 'rubygems'
require 'sinatra'
require 'activerecord'
require "yaml"

config = YAML.load_file("database.yml")
env = "locate"
ActiveRecord::Base.establish_connection(:adapter => "mysql", 
  :host => config["host"], 
  :database => config["database"],
  :username => config["username"],
  :password => config["password"],
  :socket => config["socket"],
  :wait_timeout => 20,
  :reconnect => true
)

class IpGroupCity < ActiveRecord::Base
  set_table_name "ip_group_city"
end


get '/:ip' do

#  a,b,c,d = params[:ip].split(".") 
#  ipn = ((a.to_i * 256 + b.to_i ) * 256 + c.to_i ) * 256 + d.to_i
#  loc = IpGroupCity.find_by_sql(["SELECT * FROM `ip_group_city` where `ip_start` <= ? order by ip_start desc limit 1;", ipn] ).first

  loc = IpGroupCity.find_by_sql(["SELECT * FROM `ip_group_city` where `ip_start` <= INET_ATON(?) order by ip_start desc limit 1;", params[:ip] ] ).first  
  loc.to_xml
end
