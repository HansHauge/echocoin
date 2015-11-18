class BtcRemote
  def self.connect
    # Hans local
    RPC::JSON::Client.new "http://bitcoinrpc:qGIOj9oli0g4YghvPxx4pbgpn1BK9lNm8W8z3pQtgWWXH@127.0.0.1:18332", 1.1

    # Linode
    # RPC::JSON::Client.new "http://warrenv:warrenvPASS@45.79.175.63:18332", 1.1
  end
end
