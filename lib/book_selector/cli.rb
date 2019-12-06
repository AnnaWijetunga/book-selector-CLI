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
    # @books = BookSelector::Book.all 
    # @books = BookSelector::Scraper.all

    # @books.each.with_index(1) do |book, i|
    BookSelector::Book.all.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title}"
      puts
    end 
    puts
  end 

  def menu 
    puts "Type the number of a book to read its summary. To see the book list again, type list. Or, type exit:"
    puts
    input = nil # gets.strip
    #   puts "Would you like to see more?"
    #   answer = gets.strip

    #   if ["Y", "YES"].include?(answer.upcase) # these are the acceptable yes values and whatever they type in, we turn it uppercase

    while input != "exit"
      input = gets.strip.downcase # strip, removes whitespace before and after user input
      
      if input.to_i <= BookSelector::Book.all.size
        book = BookSelector::Book.all[input.to_i-1]
        # book = @books[input.to_i-1]
        puts "#{book.title}, #{book.summary}"
        puts 

        sleep 1
        puts "Would you like to know more about this book?"
        answer = gets.strip #nil
        
        if ["Y", "YES"].include?(answer.upcase) # these are the acceptable yes values and whatever they type in, we turn it uppercase
          input
          puts "#{book.url}" # soon add #{book.author}
          puts
          puts "For more books, type list. Or, type exit to exit."
        end 

      elsif input == "list"
        list_books
      else
        puts "So sorry, I didn't understand. Please type list or exit."
      end
    end
  end 

  def goodbye
    puts "Bye for now! Happy reading!"
  end 
end 
