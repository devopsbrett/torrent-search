class Torrent < ActiveRecord::Base
  attr_accessor :resultSet

  def initialize
    @mechanize = Mechanize.new
    @mechanize.add_auth ENV[:ruhost], ENV[:ruuser], ENV[:rupass]
    super
  end

  def search(show)
    self.name = show
    self.resultSet = []

    page = @mechanize.get("https://pirateproxy.sx/search/#{name.gsub " ", "%20"}/0/99/0")

    results = page.search('#searchResult tr')
    results.shift

    results.each do |r|
      self.resultSet << {
        :name => r.at('td[2] a').children.first.text,
        :link => r.at('td[2] a[2]')["href"],
        :size => r.at('td[2] .detDesc').text[/Size (?<size>[0-9.]+[^,]+),?/, "size"]
      }
    end
    #do something
  end

  def add_to_queue(url)
    was_success = false
    addtorrent = @mechanize.post "#{ENV[:ruhost]}/php/addtorrent.php?", { url: url }
    was_success = true unless addtorrent.uri.query[/result[^=]*=Success/].nil?
    was_success
  end
end
