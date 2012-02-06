require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts Nokogiri::HTML(open('http://www.rs.lv/index.php?aid=3&id=1&action=body&print=1')).search("//font[@style='font-weight: bold;']/b").inner_html.to_s.gsub("\260","°")