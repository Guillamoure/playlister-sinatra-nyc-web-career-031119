# Add seed data here. Seed your database with `rake db:seed`
require_relative '../lib/library_parser.rb'

LibraryParser.parse
# 
# Artist.create(name: "Porcupine Tree")
# Song.create(name: "Trains", artist_id: 1)
# Genre.create(name: "Progressive Rock")
# SongGenre.create(song_id: 1, genre_id: 1)
