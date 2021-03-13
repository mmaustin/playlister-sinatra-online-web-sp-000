class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        #self.name.gsub(/[^a-z,\s]/i, '').strip.gsub(/[\s]/, '-').downcase
        self.name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        Song.all.find{|s| s.slug == slug}
    end
    
end

=begin
def self.find_by_slug(slug)
    new_array = []
    slug_split = slug.split("-")
    slug_split.each do |part|
        new_array << part.capitalize
    end
    self.find_by(name: new_array.join(" "))
=end   
