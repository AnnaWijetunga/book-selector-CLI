# CLI controller, responsible for user interactions
class BookSelector::CLI

  def call 
    list_books
    menu
    goodbye
  end

  def list_books
    puts "Welcome to Classic Children's Books!"
    sleep 2
    puts "Not sure which of the classics to read to your child next? Take a peek at the list below:"
    sleep 4
    @books = BookSelector::Book.all 

    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title}"
    end 
  end 

  def menu 
    puts "Type the number of a book to read its summary. To see the book list again, type list. Or, type exit:"
    input = nil # gets.strip

    # books = BookSelector::Book.scrape_books
    # summaries = BookSelector::Book.scrape_summaries
    # authors = BookSelector::Book.scrape_authors

    # if input.to_i-1 <= 52 # (need to change)
    #   book = books[input.to_i-1]
    #   summary = summaries[input.to_i-1]
    
    #   puts book
    #   puts
    #   puts "Summary: #{summary}"

    #   puts "Would you like to see more?"
    #   answer = gets.strip

    #   if ["Y", "YES"].include?(answer.upcase) # these are the acceptable yes values and whatever they type in, we turn it uppercase
    #   end
    # end 

    while input != "exit"
      input = gets.strip.downcase # strip, removes whitespace before and after user input
      
      if input.to_i > 0 # need to adjust if input.to_i-1 <= 52 (but need to not hard code 52)
        book = @books[input.to_i-1]
        puts "#{book.title}, #{book.summary}"
        # `open #{book.url}` very cool! opens in an actual browser!
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
