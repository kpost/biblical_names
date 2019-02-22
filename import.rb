require 'nokogiri'
require 'open-uri'

base_url = "http://www.nbv.nl/bijbelse-namen/"

all_names = []

("a".."z").each do |letter|
  scrape_url = "#{base_url}#{letter}"
  begin 
    doc = Nokogiri::HTML(open(scrape_url))

    doc.css("#center table tbody > tr").each do |line|
      name = line.css("td").first.text
      all_names << name
    end
  rescue
  end
end

`echo "#{all_names.reject(&:empty?).join("\n")}" > names.txt`