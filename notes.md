Book Selector Outline

1) [Plan gem] I want to build an application that can load classic books for kids.

  Title of book
  More about the book (summary, author, publication)

2) [Imagine interface] Command Line Interface (CLI) for book titles and selecting a book.

  User types books
  User is shown a list of classic kid's books

  1. 
  2. 
  3. 
  4. 
  5. 

  Which book do you want to learn more about?

  User enters number 1 - the number of books present

3) [Project Structure] Getting started building the structure.

  Watched one of Avi's videos (Daily Deal) and he recommended adding the structure like this (in the terminal):

    bundle gem book_selector

  Lo and behold! The structure is built. Looked through the folders/files to understand what was created for me.

4)  [Executable] Start programming from the place in which the user interacts with it. User needs to type books, and this should run a file. Let's head to the bin directory.

  bin/book-selector 

  This isn't a Ruby file, so add this code so it can be interpreted as Ruby: #!/usr/bin/env ruby
  
  Now add: puts "Hello World"

  Test in terminal by running:

  ruby bin/book-selector

  #=> Hello World

  It works! But this is through the Ruby interpreter, which isn't how a user will access my program.

  But when I type in 

  ./bin/book-selector

  I get a permissions error (Permission denied).

  Let's give ourselves permission. Type

  cd bin/

  to get to the bin directory, then 

  ls -lah 

  (list of all attributes in a readable format)
  
  Right now this file has read/write permissions, but not exectuable permissions:

  -rw-r--r--   1 annawijetunga  staff    39B Dec  2 10:56 book-selector

  Add permission to file:

  chmod +x book-selector

  Type in ls -lah

  Permission granted!

  -rwxr-xr-x   1 annawijetunga  staff    39B Dec  2 10:56 book-selector

  Now when I run 

  ./book-selector

  #=> Hello World

  It works! Permission granted!

  Taught my operating system how to interpret this file using Ruby with the shebang line AND my operating system now has permissions to execute that file through that interpreter on my behalf.

  cd ..

  To get back to my book_selector directory

5) Fast forwarding a bit - from permissions, now let's dig into creating our cli.rb to start building the interface.

  In cli.rb, start building my class BookSelector::CLI

  Thus far:

  class BookSelector::CLI
    def call 
      puts "Classic Kid's Books"
    end
  end 

  What happens when I test this out and run ./bin/book-selector?

  uninitialized constant BookSelector (NameError)

  My program has no idea what BookSelector (within bin) is.

  I never told my bin file to go into lib directory to pull info from my files.

  require '.lib/book_selector'

  But also instead of require in my lib/book_selector.rb file (here below)

  require "./book_selector/version"

  I need to add require_relative:
   
  require_relative "./book_selector/version"

  Then, within lib/book_selector.rb, I can delete the module BookSelector because that's really already existing within my lib/version.rb file

  In other news.

  When making a gem, it’s a good practice to put all the files inside a folder that is named specifically for your project (the book_selector folder).

  Ran into trouble here when I tried to require my cli folder, but it was living in my library outside of the book_selector folder.

  I plopper her into the boo_selector folder and voila, good to go.

6) [Review] Thus far, when I type ./bin/book-selector into my terminal, I now see my call:

Classic Kid's Books

Can I just say, this is so delicious.

[Show a list of books] Next up - let's keep adding to our interface and get to the meat of it all.

Let's start with "dead" data so we can practice before having to scrape real data.

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

Tested this out with a "here DOC" as advised by Avi - helpful for multi-line strings. Doing this for the time before before scraping live data.

  def list_books
    puts <<-DOC
      1. "Adventures of Huckleberry Finn"
      2. "Alice's Adventures in Wonderland"
      3. "Fairy Tales of the Brothers Grimm"
      4. "Hansel   & Grethel"
      5. "The Jungle Book"
      6. "Pinocchio"
      7. "Robin Hood"
      8. "Snow White"
      9. "Treasure Island"
      10. "The Wonderful Wizard of Oz "
    DOC
  end 

  #=> 
  Classic Kid's Books
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

Pretty cool!

7) [Editing my loop] As I run the program, I see options I'd like the user to have.

The user should see the list of books, and then be prompted to learn more about a particular book.

Time to build out a loop. We ask the user if they want to learn more - then to select a book number.

Once they do, we need to respond with more information about that book. BUT ALSO, respond with the menu again, vs closing out the program.

Thus far:

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

Now when we ask the user for their input (listig a number), they'll see "More info about" message along with that same "Want to learn more?" message from the beginning. It now loops.