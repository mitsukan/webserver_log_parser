require 'pry'

class Parser
  attr_reader :webpages
  def initialize
    @webpages = {}
  end

  def parse(filename)
    lines = File.readlines filename
    for line in lines
      arr = line.split(' ')
      if @webpages.key?(arr[0])
        @webpages[arr[0]] << arr[1]
      else
        @webpages[arr[0]] = [arr[1]]
      end
    end
  end

  def page_views
    string = ''
    for line in @webpages
      string << line[0] +' '+ line[1].length.to_s + ' visits '
    end
    string
  end

  def unique_views
    count = 0
    string = ''
    for line in @webpages
      for visit in line[1].uniq
        count += 1
      end
      string << line[0] + ' ' + count.to_s + ' unique views '
      count = 0
    end
    string
  end
end
