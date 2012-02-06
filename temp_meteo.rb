require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts Nokogiri::HTML(open('http://www.meteo.lv/public/')).search("#laikazinas/table/tr/td").first.inner_html