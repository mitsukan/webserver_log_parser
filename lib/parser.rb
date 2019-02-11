class Parser
  attr_reader :webpages
  def initialize
    @webpages = {}
  end

  def parse(filename)
    lines = File.readlines filename
    for line in lines
      ip_address = line.scan(/\s.*$/)
      print ip_address
      page = line.sub(ip_address[0], '')
      @webpages[page.strip] = ip_address[0].strip
    end
    @webpages
  end
end
