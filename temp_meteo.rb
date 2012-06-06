require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.meteo.lv/public/'))

if ARGV[0]
  puts "#{doc.search("#laikazinas/h2").inner_html.gsub("  "," ")}"

  i = 0
  doc.search("#laikazinas/table/tr").each do |tr|
    if (tr.children.first.inner_html == "Vēja virziens:")
      puts "#{tr.children.first.inner_html} #{tr.children[2].children[0].attributes['title'].value}"
    else
      puts "#{tr.children.first.inner_html} #{tr.children[2].inner_html}\n"
    end

    i = i + 1
  end
else
  puts "#{doc.search("#laikazinas/h2").inner_html.split(":  ")[1]} #{doc.search("#laikazinas/table/tr/td").first.inner_html}"
end