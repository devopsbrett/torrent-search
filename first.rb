require 'mechanize'
require 'pp'

mechanize = Mechanize.new

search = "Gothem"
url = "https://pirateproxy.sx/search/#{search.gsub " ", "%20"}/0/99/0"

page = mechanize.get(url)

results = page.search('#searchResult tr')
results.shift

resultArr = []

results.each do |r|
  resultArr << { :name => r.at('td[2] a').children.first.text, :link => r.at('td[2] a[2]')["href"] }
end

pp resultArr
