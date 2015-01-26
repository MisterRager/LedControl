require 'rubygems'  
require 'rubyserial'

#params for serial port  
#port_str = "/dev/ttyUSB0"  #may be different for you  
port_str = "/dev/ttyACM4"  #may be different for you  
baud_rate = 2000000

sp = Serial.new( port_str, baud_rate )

len = ARGV[0].to_i * 3
pattern = ARGV[1]

out = ""

while out.length < len do
	out << pattern
end

out = out[ 0, len ]

while true do
	sp.write "#{out}\r\n"
	out = (out[ -3, 3 ] + out)[0, len]
	sleep 0.04
end
