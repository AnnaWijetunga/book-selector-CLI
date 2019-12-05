# I will have to require this new file
require "open-uri"
require "nokogiri"
require "pry"



def self.all # return all instances of books after scraping read.gov
    self.scrape_books
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