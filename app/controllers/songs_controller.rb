require 'pry'
class SongsController < ApplicationController

    get '/songs' do 
        @songs = Song.all 
        erb :'/songs/index'
    end


    get '/songs/new' do
        @songs = Song.all
        @genres = Genre.all
        erb :'/songs/new'
    end

    post '/songs' do
        @song = Song.create(name: params[:Name])
        if !params["Artist Name"].empty?
            @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
            @song.genre_ids = params[:genres]
            @song.save
        end
        #binding.pry
        redirect "/songs/#{@song.slug}"
        #@song.genre_ids = params[:genres]
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'/songs/edit'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        #binding.pry
        erb :'/songs/show'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
        @song.update(params["song"])
    
    
        redirect "/songs/#{@song.slug}"
    end

end
