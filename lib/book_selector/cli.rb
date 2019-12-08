# CLI controller, responsible for user interactions
class BookSelector::CLI

  def call 
    BookSelector::Scraper.new.scrape_books
    list_books
    menu
    goodbye
  end

  def list_books
    puts "Welcome to Classic Children's Books!"
    sleep 1
    puts "Not sure which of the classics to read to your child next? Take a peek at the list below:"
    sleep 2
    puts 

    BookSelector::Book.all.each_with_index do |book, i|
      puts "#{i+1}. #{book.title}"
      puts
    end 
    puts
  end 

  def menu 
    input = nil 

    while input != "exit" # beginning of the loop
      puts "Type the number of a book to read its summary. To see the book list again, type list. Or, type exit:"
      puts
  
      input = gets.strip
      # input = gets.strip.downcase # strip, removes whitespace before and after user input
      
      if input_valid?(input)
        #if input.to_i != 0 
        book = BookSelector::Book.all[input.to_i-1]
        puts "#{book.title}, #{book.summary}"
        # book_details(book) - may build this out later

        if input.to_i <= BookSelector::Book.all.size
          book = BookSelector::Book.all[input.to_i-1]

          sleep 1
          puts "Would you like to know more about this book?"
          input = gets.strip 
        end 

        if ["Y", "YES"].include?(input.upcase) # these are the acceptable yes values, whatever they type in, we turn it uppercase
          puts book.scrape_details
          puts
          sleep 1
          puts "Visit here for even more:"
          sleep 1
          puts "#{book.url}"
          puts
          puts "For more books, type list. Or, type exit to exit."
        end 

      elsif input == "list"
        list_books
      elsif input == "exit" 
        break 
      else
        puts "So sorry, I didn't understand. Please type list or exit."
      end
    end
  end
 
  def input_valid?(input)
    if input.to_i >= BookSelector::Book.all.size || input.to_i <= 0
      return false
    else
      return true
    end
  end

  # may build this out - but let's wait a sec

  # def book_details(book)
  #   if ["Y", "YES"].include?(input.upcase) # these are the acceptable yes values, whatever they type in, we turn it uppercase
  #     puts book.scrape_details
  #     puts
  #     sleep 1
  #     puts "Visit here for even more:"
  #     sleep 1
  #     puts "#{book.url}"
  #     puts
  #     puts "For more books, type list. Or, type exit to exit."
  #   elsif ["N", "NO"].include?(input.upcase) 
  #     puts "For more books, type list. Or, type exit to exit."
  #   end 
  # end

  def goodbye
    puts "Bye for now! Happy reading!"
  end 

end 
