require 'parser'

describe Parse do
  it 'Adds the webpages to a hash' do
    parser = Parse.new
    expect(parser.webpages).to eq({})
  end
end
