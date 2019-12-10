# I will have to require this new file
require "open-uri"
require "nokogiri"
require "pry"

class BookSelector::Scraper

  def initialize(title = nil)
    @title = title # book title assigned to book as it's created
  end 

  def all # return all instances of books after scraping read.gov
    scrape_books
  end 

  def scrape_books 
    base_url = "http://read.gov/books/"
    html = open(base_url).read # opens the site object and reads the whole file/contents
    page = Nokogiri::HTML.parse(html)
    # doc = Nokogiri::HTML(open("http://read.gov/books/")) - how I've seen this condensed

    page.css("#main_body > ul:nth-child(6) > li").each do |book_node|
      # book = new
      book = BookSelector::Book.new # instantiate instances of the book class object
      
      title_node = book_node.css("strong") # title
      book.title = title_node.text
      
      read_more_url_node = book_node.css("p > a").find do |node| # url - more about this book
        node.text == "More About this Book"
      end
      
      relative_path = read_more_url_node.attribute("href")  # url - more about this book
      url = "#{base_url}#{relative_path}"
      book.url = url 
  
      book_text = book_node.css("p").to_s # summary
      summary = book_text.split("<br>")[1].strip
      book.summary = summary
      book.save # save all book instances so we can see them as output!
    end
  end 
end