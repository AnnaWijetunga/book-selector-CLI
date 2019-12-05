# I will have to require this new file
require "open-uri"
require "nokogiri"
require "pry"

class BookSelector::Book

  attr_accessor :title, :summary, :url

  def self.all
    # I should return instances of books
    # scrape read.gov and return books based on that data
    self.scrape_books
    # BookSelector::BookScraper.new("http://read.gov/books/")
    # BookSelector::BookScraper.new.books 
  end 

  def self.scrape_books 
    base_url = "http://read.gov/books/"
    html = open(base_url).read 
    page = Nokogiri::HTML.parse(html)
    # doc = Nokogiri::HTML(open("http://read.gov/books/"))

    page.css("#main_body > ul:nth-child(6) > li").map do |book_node|
      book = new
      
      title_node = book_node.css("strong")
      book.title = title_node.text
      
      read_more_url_node = book_node.css("p > a").find do |node|
        node.text == "More About this Book"
      end
     
      relative_path = read_more_url_node.attribute("href")
      url = "#{base_url}#{relative_path}"
      book.url = url 
      
      book_text = book_node.css("p").to_s
      summary = book_text.split("<br>")[1].strip
      book.summary = summary
      book
    end
  end

  def self.scrape_author()
  end 

  def self.create_books
    # go to read.gov
    # find the books
    # extract the properties
    # instantiate the book

    # books = []
    # books # an array of books I just scraped

    # my old, hard-coded data:
    book_1 = self.new # self is Book here
    book_1.title = "'Adventures of Huckleberry Finn'"
    book_1.summary = "This great American novel follows the adventures of a teenager and his life on the Mississippi River."
    book_1.url = "http://read.gov/books/"

    book_2 = self.new # self is Book here
    book_2.title = "'Alice's Adventures in Wonderland'"
    book_2.summary = "A girl named Alice falls into a rabbit hole, where she encounters a world of strange creatures."
    book_2.url = "http://read.gov/books/"
    
    [book_1, book_2]
  end 

  def to_s 
    "Book: #{title}, summary: #{summary}, url: #{url}"
  end
end 

