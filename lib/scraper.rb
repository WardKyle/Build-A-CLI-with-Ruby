require_relative "cli.rb"
require 'nokogiri'
require 'open-uri'
require 'byebug'

module Scraper
  URL = "https://quotes.toscrape.com/"

  @@list = []
  @@authors = []
  @@quotes = []
  
  def self.extract
    scrape_data
    @@list.each do |el|
      authors = el.css('.author').text.strip
      quotes = el.css('.text').text.strip
      @@authors << authors
      @@quotes << quotes
    end
  end
  
  def self.scrape_data
    unparsed_page = URI.open(URL)
    doc = Nokogiri::HTML(unparsed_page)
    quotes = doc.css('.quote')
    quotes.each do |el|
      @@list << el
    end
  end

  def self.authors
    @@authors
  end
    
  def self.quotes
    @@quotes
  end
end