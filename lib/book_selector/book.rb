# I have had to require this new file in my book_selector.rb (environment) file

require "open-uri"
require "nokogiri"
require "pry"

class BookSelector::Book # for storing data (not scraping - moved that)

  attr_accessor :title, :summary, :url
  @@all = []

  def self.all
    @@all
  end 

  def save
    @@all << self
  end 

end 

# Moved all scraping methods over to scraper.rb
