class ArtistsController < ApplicationController

    get '/songs' do
      @songs = Song.all
      erb :"/songs/index"
    end

    get '/songs/new' do
      erb :"/songs/new"
    end

    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :"/songs/show"
    end

    get '/artists' do
      @artists = Artist.all
      erb :"/artists/index"
    end


    get '/artists/:slug' do
      @artist = Artist.find_by_slug(params[:slug])
      erb :"/artists/show"
    end

    get '/genres' do
      @genres = Genre.all
      erb :"/genres/index"
    end

    get '/genres/:slug' do
      @genre = Genre.find_by_slug(params[:slug])
      erb :"/genres/show"
    end


    post '/songs/:slug' do
      @artist = Artist.find_or_create_by(name: params["Artist Name"])
      @song = Song.create(name: params[:Name], artist_id: @artist.id)
      arr = params.to_a
      arr.pop
      arr.shift(2)
      arr.each do |genre|
        SongGenre.create(song_id: @song.id, genre_id: genre[1])
      end
      redirect to("/songs/#{@song.slug}")
    end

    get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      erb :"/songs/edit"
    end

    patch '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      artist = Artist.find_or_create_by(name: params["Artist Name"])

      @song.update(name: params[:Name], artist_id: artist.id)
      redirect to("/songs/#{@song.slug}")
    end
end
