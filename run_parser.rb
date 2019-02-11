require './lib/parser'
require 'pry'

@filename = ARGV

def run(filename)
  parser = Parser.new
  parser.parse(filename[0])
  page_views = parser.page_views
  unique_views = parser.unique_views
  print page_views
  print "\n"
  print unique_views
end

run(@filename)
