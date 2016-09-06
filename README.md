# GameOfThronesApi

Something for **Game of Thrones** & **A Song of Ice and Fire** fans.

A Ruby API Wrapper using [An API Of Ice And Fire](https://anapioficeandfire.com/). All credit goes to **Joakim Skoog** the creator of the API.

Still In developement. Basic Functionality. Find Books, Characters and Houses.

##### TODO: Implement better filtering, fuzzy find for houses, complete API functionality and of course tests.

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

#### An API Of Ice And Fire is public, no authentication required

#### Retrieve all Books
```
GameOfThronesApi.get_books
```

#### Find a single book, by book title.
```
GameOfThronesApi.find_book('A Dance with Dragons')
```

#### Retrieve all Characters
```
GameOfThronesApi.get_characters
```

#### Find a Character by Name (enter full name).
```
GameOfThronesApi.find_book('Jon Snow')
```

#### Retrieve all Houses
```
GameOfThronesApi.get_houses
```

#### Find a specific House, must be complete house name. Will implement a fuzzy search in the future.
```
GameOfThronesApi.find_house("House Targaryen of King's Landing")
```
To list all House names (444 in total) do the following
```
houses = GameOfThronesApi.get_houses
houses.map { |house| house['name'] }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jzntam/game_of_thrones_api. Contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

