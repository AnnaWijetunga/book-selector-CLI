# CLI controller, responsible for user interactions
class BookSelector::CLI

  def call 
    list_books
    menu
    goodbye
  end

  def list_books
    puts "Classic Kid's Books"
    puts <<-DOC
      1. "Adventures of Huckleberry Finn"
      2. "Alice's Adventures in Wonderland"
      3. "Fairy Tales of the Brothers Grimm"
      4. "Hansel & Grethel"
      5. "The Jungle Book"
      6. "Pinocchio"
      7. "Robin Hood"
      8. "Snow White"
      9. "Treasure Island"
      10. "The Wonderful Wizard of Oz "
    DOC
  end 

  def menu 
    # puts "Want to learn more? Type the number of any book or type exit to enter:"
    input = nil
    while input != "exit"
      puts "Want to learn more? Type the number of any book or type exit to enter:"
      
      input = gets.strip.downcase # strip, removes whitespace before and after user input
      case input 
      when "1"
        puts "More about book 1."
      when "2"
        puts "More about book 2."
      end
    end
  end 

  def goodbye
    puts "Until next time! Happy reading!"
  end 
end 
