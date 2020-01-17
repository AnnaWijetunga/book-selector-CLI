# I have had to require this new file in my book_selector.rb (environment) file

require "open-uri" # lets us open the HTML like a file and pass it to Nokogiri
require "nokogiri"
require "pry"

# require - method used when to reference/execute code that is not written in my current file (for external files) - looks inside path
# require_relative - subset of require, method used when referring to a file that is within same project directory - looks inside specific file

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

  # two methods
  # method to sort books
  # method to takes in user input - looks for a book that starts with a letter, return all books that start with or include that letter

  def sort_books
    # sort by starting with A - Z 
    # iterate over all book titles, looking at the first letter of the title
    # title is alphabetized
    # return the list of books in order

    # need all books
    self.all.sort_by { |book| book.title }
  end

end 

# def title  # getter method
#   @title
# end 

# def title=title # setter method
#   @title = title
# end