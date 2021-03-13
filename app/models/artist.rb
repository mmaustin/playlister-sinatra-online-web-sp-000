require 'pry'
class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        #self.name.gsub(/[^a-z,\s]/i, '').strip.gsub(/[\s]/, '-').downcase
        self.name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        Artist.all.find{|g| g.slug == slug}
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