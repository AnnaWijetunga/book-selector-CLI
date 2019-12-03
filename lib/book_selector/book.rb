# I will have to require this new file

class BookSelector::Book

  def self.all
    # I should return instances of books
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


end 