require 'rubygems'
require 'rpcjson'

# 1.1 is required because bitcoind does not speak 2.0
#bc = RPC::JSON::Client.new 'http://username:password@127.0.0.1:8332', 1.1
#bc = RPC::JSON::Client.new 'http://warrenv:warrenvPASS@127.0.0.1:18332', 1.1
# bc = RPC::JSON::Client.new 'http://hansh:hanshPASS@45.79.175.63:18444', 1.1
# bc = RPC::JSON::Client.new 'http://username:password@127.0.0.1:8332', 1.1
#
# hans local
#bc = RPC::JSON::Client.new "http://bitcoinrpc:qGIOj9oli0g4YghvPxx4pbgpn1BK9lNm8W8z3pQtgWWXH@127.0.0.1:18332", 1.1

# linode
bc = RPC::JSON::Client.new 'http://warrenv:warrenvPASS@45.79.175.63:18332', 1.1

# JSON-RPC error objects are raised as Ruby objects of the type
# RPC::JSON::Client::Error. The original object is available at
# e.error

begin

  # First get server info
  puts "Getting server information..."
  info = bc.getinfo
  info.each_key do |key|
    puts "#{key}: #{info[key]}"
  end

#  puts "balance: #{bc.getbalance}"
 # puts "wallet: #{bc.getwalletinfo}"
# puts "bc.getaccount: #{bc.getaccount(mnzpBbvHeiH8LUPHYnjHso3zbJ5KsH6RGX)}"
#  puts "getnewaddress: #{bc.getnewaddress}"
  # puts "received: #{bc.sendtoaddress('mnzpBbvHeiH8LUPHYnjHso3zbJ5KsH6RGX', 1.0)}"


  # Will raise error
  puts "Shutting down the server..."
  bc.st0p
rescue RPC::JSON::Client::Error => e
  puts "Got an error: #{e}: #{e.error.to_json}"
end
