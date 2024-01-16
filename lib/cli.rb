require_relative "scraper.rb"
require "nokogiri"
require "open-uri"
require "byebug"



class CLI

  def run_cli
    Scraper.extract
    greeting
    until quote == "exit"
    end
    thanks
  end

  def greeting
    puts "Welcome to the quotes scraper.\n\nSelect a number from the list of authors below to receive one of their quotes,\n\nType 'exit' to quit"
      puts "-------"
    Scraper.authors.each_with_index do |el,i|
      puts "#{i+1}. #{el}"
    end
  end
  def quote
    num = gets.chomp.strip.downcase
    if num == 'exit'
      return num
    elsif num.to_i < 1 or num.to_i > 10
      puts "Please try again and enter a correct number in the list"
      return 0
    end
    quotes = Scraper.quotes
    puts quotes[num.to_i-1]
  end

  def thanks
    puts "\nThanks for stopping by!"
  end

end