class BlockExplorerApi
  attr_reader :btc_address

  def initialize(btc_address)
    @btc_address = btc_address
  end

  def check_balance
    response = HTTParty.get("https://blockexplorer.com/api/addr/#{btc_address}/balance")
    if response == 0
      return 0
    elsif response.success?
      puts "API failure, response code not success...switching to backup source..."
      return "response code not success" # implement backup source
    else
      return response.parsed_response / 100000000.0
    end
  end
end
