class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        #self.name.gsub(/[^a-z,\s]/i, '').strip.gsub(/[\s]/, '-').downcase
        self.name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        Genre.all.find{|g| g.slug == slug}
    end
    
end

=begin
        m = []
        a = slug.split("-")
        a.each do |n|
          m << n.capitalize
        end
        self.find_by(name: m.join(" "))       
=end