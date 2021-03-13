require 'pry'
class SongsController < ApplicationController

    get '/songs' do 
        @songs = Song.all 
        erb :'songs/index'
    end

    get '/songs/new' do
        @songs = Song.all
        @genres = Genre.all
        erb :'songs/new'
    end


    post '/songs' do
        #binding.pry
        @song = Song.create(name: params[:Name])
        #if @song.artist.nil?
            @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
           # @song.genre_ids = params[:genre_ids]
            @song.save
        #end
        #binding.pry
        redirect "/songs/#{@song.slug}"

    end

=begin
    post '/songs' do
        #binding.pry
        @song = Song.create(params["Name"])
        #@song = Song.create(name: params[:song])
        if !params["Artist Name"].empty?
            @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
            @song.genre_ids = params[:genre_ids]
            @song.save
        end
        #binding.pry
        redirect "/songs/#{@song.slug}"    
    end
=end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'songs/edit'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        #binding.pry
        erb :'songs/show'
    end


    patch '/songs/:slug' do
=begin
        if !params.keys.include?([:genres])
            params[:genres] = []
        end
=end

        @song = Song.find_by_slug(params[:slug])
        @song.update(params)#[:genre_ids])
        if !params["Artist Name"].empty?
            @song.artist = Artist.find_or_create_by("Artist Name"=> params["Artist Name"])
            #@song.genre_ids = params[:genre_ids]
            @song.save
        end
    
        redirect "/songs/#{@song.slug}"
    end

end


