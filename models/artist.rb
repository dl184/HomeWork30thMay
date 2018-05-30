require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end


  def list_albums_by_artist
    sql = 'SELECT * FROM albums WHERE artist_id = $1'
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|data| Artist.new(data)}
  end

end
