# I have had to require this new file in my book_selector.rb (environment) file

require "open-uri" # lets us open the HTML like a file and pass it to Nokogiri
require "nokogiri"
require "pry"

class BookSelector::Book # defines how to build a book - and used for storing data about books 

  attr_accessor :title, :summary, :url
  @@all = []

  def self.all 
    @@all # class variable that stores every book instance upon initialization.
  end 

  # every object is aware of itself
  # define methods in which we tell objects to operate on themselves

  def save
    @@all << self
  end 

  def scrape_details
    doc =  Nokogiri::HTML(open(self.url))
    doc.css("div #col2full_left").css('ul').children[1].text
  end

end 

# def title  # getter method
#   @title
# end 

# def title=title # setter method
#   @title = title
# end