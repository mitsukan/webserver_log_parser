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
    # print @webpages
    for page in @webpages
      string << page[0]
      for visit in page[1].uniq
        count += 1
      end
    end
    print string
    string + ' ' + count.to_s + ' unique views '
  end

end
