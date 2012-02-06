require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.meteo.lv/public/'))

puts "#{doc.search("#laikazinas/h2").inner_html.gsub("  "," ")}"

i = 0
doc.search("#laikazinas/table/tr").each do |tr|
  if i == 2
    puts "#{tr.children.first.inner_html} #{tr.children[2].children[0].attributes['title'].value}"
  else
    puts "#{tr.children.first.inner_html} #{tr.children[2].inner_html}\n"
  end

  i = i + 1
end