require "game_of_thrones_api/version"
require "httparty"

module GameOfThronesApi
  include HTTParty
  format :json

  BASE_ENDPOINT = "http://anapioficeandfire.com/api"

  def self.get_books
    response    = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")
    total_pages = get_page_count(response)

    get_all_records('books', response, total_pages)
  end

  def self.find_book(name)
    name = name_query(name)
    get("#{BASE_ENDPOINT}/books#{name}").parsed_response
  end

  def self.get_characters
    response    = get("#{BASE_ENDPOINT}/characters?page=1&pageSize=50")
    total_pages = get_page_count(response)

    get_all_records('characters', response, total_pages)
  end

  def self.find_character(name)
    name = name_query(name)
    get("#{BASE_ENDPOINT}/characters#{name}").parsed_response
  end

  def self.get_houses
    response    = get("#{BASE_ENDPOINT}/houses?page=1&pageSize=50")
    total_pages = get_page_count(response)

    get_all_records('houses', response, total_pages)
  end

  def self.find_house(name)
    name = name_query(name)
    get("#{BASE_ENDPOINT}/houses#{name}").parsed_response
  end

  module_function

  def name_query(filter)
    "/?name=#{uri_escape(filter)}"
  end

  def uri_escape(term)
    term.gsub(' ', '%20')
  end

  def get_page_count(response)
    page_links = response.headers['link'].scan(/<(\S+)>/).flatten
    /\?page\=(\d+)\&/.match(page_links.last)[1].to_i
  end

  def get_all_records(category, response, total_pages, page = 1)
    characters  = response.parsed_response

    while total_pages >= page
      page       += 1
      characters += get("#{BASE_ENDPOINT}/#{category}?page=#{page}&pageSize=50").parsed_response
    end

    characters
  end
end
