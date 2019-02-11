class Parser
  attr_reader :webpages
  def initialize
    @webpages = {}
  end

  def parse(filename)
    lines = File.readlines filename
    for line in lines
      ip_address = line.scan(/\s.*\z/)[0]
      page = line.sub(ip_address, '')
      @webpages[page] = ip_address.strip
    end
    @webpages
  end
end
