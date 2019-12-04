# CLI controller, responsible for user interactions
class BookSelector::CLI

  def call 
    list_books
    menu
    goodbye
  end

  def list_books
    puts "Classic Children's Books"
    @books = BookSelector::Book.all 

    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title}"
    end 
  end 

  def menu 
    input = nil
    while input != "exit"
      puts "Would you like to learn more about a book? Type the number of a book or type list to see the books again or type exit:"
      input = gets.strip.downcase # strip, removes whitespace before and after user input
      
      if input.to_i > 0
        book = @books[input.to_i-1]
        puts "#{book.title}"
        # `open #{book.url}` very cool! opens in an actual browser!
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
