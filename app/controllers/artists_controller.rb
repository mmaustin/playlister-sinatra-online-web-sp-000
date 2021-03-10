require 'pry'
class ArtistsController < ApplicationController

    get '/artists' do
        @artists = Artist.all
        erb :'/artists/index'
    end

    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        #binding.pry
        erb :'/artists/show'
    end

end

=begin
    
<% @artist.songs.each do |s|%>
    <%= s.name%><br><br>
<% end%>

<% @artist.songs.each do |s|%>
    <% s.genres.each do |g|%>
        <%= g.name%>
    <% end %>
<%end%>
    
=end