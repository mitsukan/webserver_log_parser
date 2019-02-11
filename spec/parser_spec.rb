require 'parser'

describe 'Parser' do
  it 'Adds the webpages to a hash' do
    parser = Parser.new
    expect(parser.webpages).to eq({})
  end

  describe '.parse' do
    it 'Parses a log file' do
      parser = Parser.new
      parser.parse('./spec/test.log')
      expect(parser.webpages).to eq({'/help_page/1' => '126.318.035.038'})
    end
  end
end
