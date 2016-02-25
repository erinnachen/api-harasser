require 'faraday'
require 'pry'
require 'json'
require 'date'

class TopStoriesGenerator
  attr_accessor :section, :nstories, :data

  def initialize
    if valid_sections.include?(ARGV[0])
      self.section = ARGV[0]
    else
      self.section = "science"
    end
    self.nstories = ARGV[1].to_i || 10
  end

  def valid_sections
    ["home", "world", "national", "politics", "nyregion", "business", "opinion", "technology", "science", "health", "sports", "arts", "fashion", "dining", "travel", "magazine", "realestate"]
  end

  def api_url
    "http://api.nytimes.com/svc/topstories/v1/#{section}.json?api-key=#{ENV["API_KEY"]}"
  end

  def get_stories
    make_requests
    print_stories
  end

  def make_requests
    response = Faraday.get(api_url)
    self.data = JSON.parse(response.body,  object_class: OpenStruct)
  end

  def print_stories
    articles = data.results[0...nstories]
    articles.each do |article|
      filtered = [article.title,
                  article.byline,
                  "Published on #{Date.parse(article.published_date).strftime("%B %-d, %Y")}",
                  article.abstract,
                  article.url,]
      puts filtered.join("\n")
      puts "\n"
    end
  end
end

if __FILE__ == $0
  puts "Connecting to NYTimes API with #{ARGV[0]}"
  tsg = TopStoriesGenerator.new
  tsg.get_stories
end
