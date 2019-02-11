require 'parser'

describe 'Parser' do
  let(:parser) {Parser.new}

  it 'Adds the webpages to a hash' do
    expect(parser.webpages).to eq({})
  end

  describe '.parse' do
    it 'Parses a single line log file' do
      parser.parse('./spec/test.log')
      expect(parser.webpages).to eq({'/help_page/1' => '126.318.035.038'})
    end

    it 'Parses multiple lines in a log file' do
      parser.parse('./spec/test2.log')
      expect(parser.webpages).to eq({'/help_page/1' => '126.318.035.038', '/contact' =>'184.123.665.067', '/home' =>'184.123.665.067', '/about/2' =>'444.701.448.104'})
    end
  end
end
