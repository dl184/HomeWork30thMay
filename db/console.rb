require("pry")
require_relative("../models/artist")
require_relative("../models/album")

Artist.delete_all()

artist1 = Artist.new({'name' => "Liam Gallagher"})
artist1.save()
artist2 = Artist.new({'name' => "Noel Gallagher"})
artist2.save()
artist3 = Artist.new({'name' => "Ian Brown"})
artist3.save()



album1 = Album.new({'title' => "What's the story", "artist_id" => artist1.id})
album1.save()
album2 = Album.new({'title' => "Masterplan", "artist_id" => artist2.id})
album2.save()
album3 = Album.new({'title' => "The Stone Roses", "artist_id" => artist3.id})
album3.save()



# artist1.list_albums_by_artist()
# album1.name_artist_by_album()
binding.pry
nil
