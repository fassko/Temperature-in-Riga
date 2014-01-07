#!/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.rs.lv/index.php?aid=3&id=1&action=body&print=1'))
doc.encoding = 'utf-8'
puts "Pašlaik Rīgā: " + doc.search("//font[@style='font-weight: bold;']/b").inner_html

if ARGV[0]
  puts "\n"

  doc.search("//td[@class='meteo_graph']/table/tr").each do |tr|
    if (tr.children.first.inner_html != "Datums/stunda")
      date_parts = tr.children.first.inner_html.split("/")
      puts "#{date_parts[0]}.#{Time.now.strftime("%M.%Y")} #{date_parts[1]}:00  #{tr.children.last.inner_html}°C"
    end
  end
end