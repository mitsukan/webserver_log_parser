require 'parser'

describe 'Parser' do
  let(:parser) {Parser.new}

  it 'Adds the webpages to a hash' do
    expect(parser.webpages).to eq({})
  end

  describe '.parse' do
    it 'Parses a single line log file' do
      parser.parse('./spec/test.log')
      expect(parser.webpages).to eq({'/help_page/1' => ['126.318.035.038']})
    end

    it 'Parses multiple lines in a log file' do
      parser.parse('./spec/test2.log')
      expect(parser.webpages).to eq({'/help_page/1' => ['126.318.035.038'], '/contact' =>['184.123.665.067'], '/home' =>['184.123.665.067'], '/about/2' =>['444.701.448.104']})
    end

    it 'Collates visits from multiple IPs' do
      parser.parse('./spec/test3.log')
      expect(parser.webpages).to eq({'/help_page/1' => ['126.318.035.038','184.123.665.067', '184.123.665.067', '444.701.448.104']})
    end
  end

  describe '.page_views' do
    it 'Returns a page and page views' do
      parser.parse('./spec/test.log')
      expect(parser.page_views).to eq('/help_page/1 1 visits ')
    end

    it 'Returns all the pages and views' do
      parser.parse('./spec/test2.log')
      expect(parser.page_views).to eq('/help_page/1 1 visits /contact 1 visits /home 1 visits /about/2 1 visits ')
    end

    it 'Can count the views of the pages' do
      parser.parse('./spec/test3.log')
      expect(parser.page_views).to eq('/help_page/1 4 visits ')
    end

  end
end
