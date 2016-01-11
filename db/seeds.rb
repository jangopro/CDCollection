# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Artiste.create([{nom: 'Rush'}, {nom: 'Linkin Park'}, {nom: 'Tool'}])
Album.create([{name: 'Moving Pictures', anneeSortie: 1981, artiste_id: 1, typeAlbum: 1}, 
              {name: 'Rush', anneeSortie: 1974, artiste_id: 1, typeAlbum: 1},
              {name: 'Fly By Night', anneeSortie: 1975, artiste_id: 1, typeAlbum: 1},
              {name: 'Caress of Steel', anneeSortie: 1975, artiste_id: 1, typeAlbum: 1},
              {name: '10,000 Days', anneeSortie: 2006, artiste_id: 2, typeAlbum: 1},
              {name: 'Lateralus', anneeSortie: 2001, artiste_id: 2, typeAlbum: 1},
              {name: 'Opiate', anneeSortie: 1992, artiste_id: 2, typeAlbum: 2}])