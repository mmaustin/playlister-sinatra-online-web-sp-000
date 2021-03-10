class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.gsub(/[^a-z,\s]/i, '').strip.gsub(/[\s]/, '-').downcase
    end

    def self.find_by_slug(slug)
        m = []
        a = slug.split("-")
        a.each do |n|
          m << n.capitalize
        end
        self.find_by(name: m.join(" "))
    end
    
end