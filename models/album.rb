require('pg')
require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_reader :title, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, artist_id) VALUES ($1, $2)
    RETURNING id"
    values = [@title, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  # def name_artist_by_album()
  #   sql = "SELECT * FROM artists WHERE artist_id = $1"
  #   values = [@id]
  #   results = SqlRunner.run(sql, values)
  #   return results[0]
  # end

end

# List all the albums they have by an artist

# def list_all()
#   sql = "SELECT * FROM albums WHERE artist_id = $1"
#   values = [@id]
#   results = SqlRunner.run(sql, values)
#   return results.map {|data| Album.new(data)}
