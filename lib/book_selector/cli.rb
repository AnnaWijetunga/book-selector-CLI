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
    puts 
    @books = BookSelector::Book.all 

    @books.each.with_index(1) do |book, i|
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
      
      if input.to_i > 0 # need to adjust if input.to_i-1 <= 52 (but need to not hard code 52)
        book = @books[input.to_i-1]
        puts "#{book.title}, #{book.summary}"
        puts 

        sleep 1
        puts "Would you like to learn more about this book?"
        answer = gets.strip #nil
        
        if ["Y", "YES"].include?(answer.upcase) # these are the acceptable yes values and whatever they type in, we turn it uppercase
          input
          author = BookSelector::Book.scrape_url(input)
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
