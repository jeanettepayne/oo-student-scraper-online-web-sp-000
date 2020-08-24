require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))
    student_info_card = doc.css("div .student-card")
    
    student_info_card.collect do |attributes|
      {:name => attributes.css("h4").text,
        :location => attributes.css("p").text,
        :profile_url => attributes.css("a").attr("href").value
      }
    end
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    binding.pry
    {:twitter => doc.css("div .social-icon-container a").attr("href").value,
    # :linkedin => doc.css("div .social-icon-container",
    # :github => ,
    # :blog => ,
    # :profile_quote => ,
    # :bio => 
    }
  
  end

end


#all info - div class student-card
# name - div card-text-container -> h4 class student-name
#location - div card-text-container -> p class student-location
#profile url - a href