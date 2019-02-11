class Parser
  attr_reader :webpages
  def initialize
    @webpages = {}
  end

  def parse(filename)
    lines = File.readlines filename
    for line in lines
      arr = line.split(' ')
      @webpages[arr[0]] = arr[1]
    end
    @webpages
  end
end
