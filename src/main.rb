require_relative './scraper'

class Main
  def self.main
    s = Scraper.new
    puts s.read_fic_table_of_content "https://www.royalroad.com/fiction/107917/sky-pride"
  end
end

Main.main
