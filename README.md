# GameOfThronesApi

Something for **Game of Thrones** & **A Song of Ice and Fire** fans.

A Ruby API Wrapper using [An API Of Ice And Fire](https://anapioficeandfire.com/). All credit goes to **Joakim Skoog** the creator of the API.

Still In developement. Basic Functionality. Find Books, Characters and Houses.

##### TODO: Implement better filtering, complete API functionality and of course tests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'game_of_thrones_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install game_of_thrones_api

## Usage

#### [An API Of Ice And Fire](https://anapioficeandfire.com/) is public, no authentication required

#### Retrieve all Books
```ruby
GameOfThronesApi.get_books
```

#### Find a Book by Title or Partial Title.
```ruby
GameOfThronesApi.find_book('A Dance with Dragons')

or

GameOfThronesApi.find_book('dragon')
```

#### Retrieve all Characters
```ruby
GameOfThronesApi.get_characters
```

#### Find a Character by Name or Partial Name
```ruby
GameOfThronesApi.find_character('Jon Snow')

or

GameOfThronesApi.find_character('baratheon')
```

#### Retrieve all Houses
```ruby
GameOfThronesApi.get_houses
```

#### Find a House by Name
```ruby
GameOfThronesApi.find_house('targaryen')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jzntam/game_of_thrones_api. Contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

