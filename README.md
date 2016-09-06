# GameOfThronesApi

Something for *Game of Thrones* & *A Song of Fire and Ice* fans.

API Wrapper using [An API Of Ice And Fire](https://anapioficeandfire.com/)

Still In developement. Basic Functionality. Find Books, Characters and Houses.

##### TODO: Better filtering, fuzzy find for houses, complete API functionality and of course tests.

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

#### An API Of Ice And Fire is Public, no authentication required

#### Retrieve Books
```
GameOfThronesApi.get_books
```

#### Find a single book
```
GameOfThronesApi.find_book('A Dance with Dragons')
```

#### Retrieve Characters
```
GameOfThronesApi.get_characters
```

#### Find a character
```
GameOfThronesApi.find_book('Jon Snow')
```

#### Retrieve House
```
GameOfThronesApi.get_houses
```

#### Find a specific House, must be complete house name. Will implement a fuzzy search in the future.
```
GameOfThronesApi.find_house("House Targaryen of King's Landing")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jzntam/game_of_thrones_api. Contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

