# BookSelector

Welcome! Running this gem will enable you to enter an application where you can select from a list of classic children's books to find out more information (summary, author, link to more). Enjoy!

## Video Walkthrough

Click here for a 1-minute video walkthrough: https://vimeo.com/378164946

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'book_selector'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install book_selector

## Usage

Run ./bin/book-selector in your terminal:

    $ ./bin/book-selector

You'll be welcomed to the program and prompted to enter the number of a book title. Once you select a book by its number, you'll see a brief summary of the book, and you'll be asked if you'd like to learn more. If yes, you'll see a link to the book summary, which you can open in your browser. If not, you can select a new book number or at any time, type exit to leave the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AnnaWijetunga/book-selector-CLI. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BookSelector project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<AnnaWijetunga>/book_selector/blob/master/CODE_OF_CONDUCT.md).
