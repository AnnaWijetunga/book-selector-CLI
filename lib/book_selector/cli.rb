# CLI controller, responsible for user interactions
class BookSelector::CLI

  def call 
    list_books
    menu
    goodbye
  end

  def list_books
    puts "Classic Kid's Books"
    @books = BookSelector::Book.all # time to make a new file, book
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title}"
    end 

  end 

  def menu 
    input = nil
    while input != "exit"
      puts "Want more? Type the number of a book or type list to see the books again or type exit:"
      input = gets.strip.downcase # strip, removes whitespace before and after user input
      
      if input.to_i > 0
        the_book = @books[input.to_i-1]
        puts "#{the_book.title}"
      elsif input == "list"
        list_books
      else
        puts "Let's try again - type list or exit."
      end
    end
  end 

  def goodbye
    puts "Until next time! Happy reading!"
  end 
end 
