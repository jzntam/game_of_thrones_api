require 'game_of_thrones_api/version'
require 'httparty'

# There are 3 'get' methods, each method returns an Array of all the records
# for that specific category.
#
# Currently there are 12 Books, 2134 Characters and 444 Family Houses.
#
# Each 'get' method is memoized for performance and to reduce API calls.
#
# Each 'find' method takes a 'term' and searches the name column of that
# category for any matches.

module GameOfThronesApi
  include HTTParty
  format :json

  BASE_ENDPOINT  = "http://anapioficeandfire.com/api".freeze

  WORD_PARTICLES = %w(and or the over to the a but of for with).freeze

  def self.get_books
    @get_books ||= begin
      response    = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")
      total_pages = get_page_count(response)

      get_all_records('books', response, total_pages)
    end
  end

  def self.find_book(name)
    books ||= GameOfThronesApi.get_books
    query   = titleize_query(name)

    books.select { |book| book['name'].include?(query) }
  end

  def self.get_characters
    @get_characters ||= begin
      response    = get("#{BASE_ENDPOINT}/characters?page=1&pageSize=50")
      total_pages = get_page_count(response)

      get_all_records('characters', response, total_pages)
    end
  end

  def self.find_character(name)
    characters ||= GameOfThronesApi.get_characters
    query        = titleize_query(name)

    characters.select { |character| character['name'].include?(query) }
  end

  def self.get_houses
    @get_houses ||= begin
      response    = get("#{BASE_ENDPOINT}/houses?page=1&pageSize=50")
      total_pages = get_page_count(response)

      get_all_records('houses', response, total_pages)
    end
  end

  def self.find_house(name)
    houses ||= GameOfThronesApi.get_houses
    query    = titleize_query(name)

    houses.select { |house| house['name'].include?(query) }
  end

  module_function

  def name_query(filter)
    "/?name=#{uri_escape(filter)}"
  end

  def uri_escape(term)
    term.gsub(' ', '%20')
  end

  # The pagination information is in the Headers
  # We retrieve the links from the Headers using a regex
  # There will always be 3 links, the last link, redirects to the last page.
  # We take the page number from the last link as our page count.
  def get_page_count(response)
    page_links = response.headers['link'].scan(/<(\S+)>/).flatten
    /\?page\=(\d+)\&/.match(page_links.last)[1].to_i
  end

  def titleize_query(query)
    split_words =
      query.split.map.with_index do |word, index|
        if WORD_PARTICLES.exclude?(word) || index.zero?
          word.capitalize
        else
          word
        end
      end

    split_words.join(' ')
  end

  # The API results are paginated, just looping through the pages to collect
  # all the records associated with the category.
  def get_all_records(category, response, total_pages, page = 1)
    characters  = response.parsed_response

    while total_pages >= page
      page       += 1
      characters += get("#{BASE_ENDPOINT}/#{category}?page=#{page}&pageSize=50").parsed_response
    end

    characters
  end
end
