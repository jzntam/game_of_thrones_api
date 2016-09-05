require "game_of_thrones_api/version"
require "httparty"

module GameOfThronesApi
  include HTTParty
  format :json

  BASE_ENDPOINT = "http://anapioficeandfire.com/api"

  def self.get_books
    get("#{BASE_ENDPOINT}/books").parsed_response
  end

  def self.find_book(name)
    name = name_query(filter)
    get("#{BASE_ENDPOINT}/books#{name}").parsed_response
  end

  def self.get_characters
    get("#{BASE_ENDPOINT}/characters").parsed_response
  end

  def self.find_character(name)
    name = name_query(filter)
    get("#{BASE_ENDPOINT}/characters#{name}").parsed_response
  end

  def self.get_houses
    filter = name_query(filter) if filter
    get("#{BASE_ENDPOINT}/houses#{filter}").parsed_response
  end

  def self.find_house(name)
    filter = name_query(filter) if filter
    get("#{BASE_ENDPOINT}/houses#{filter}").parsed_response
  end

  module_function

  def name_query(filter)
    "/?name=#{uri_escape(filter)}"
  end

  def uri_escape(term)
    term.gsub(' ', '%20')
  end
end
