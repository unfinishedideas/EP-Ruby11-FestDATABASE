class Artist
  attr_reader :id
  attr_accessor :name, :genre, :stage_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @stage_id = attributes.fetch(:stage_id)
    @id = attributes.fetch(:id)
    @genre = attributes.fetch(:genre)
  end

  def ==(artist_to_compare)
    self.name().downcase().eql?(artist_to_compare.name.downcase()) &&
    self.genre().downcase().eql?(artist_to_compare.genre.downcase()) &&
    self.stage_id().eql?(artist_to_compare.stage_id())
  end

  def self.all
    returned_artists = DB.exec("SELECT * FROM artists;")
    artists_array = []
    returned_artists.each() do |artist|
      name = artist.fetch("name")
      id = artist.fetch("id").to_i
      stage_id = artist.fetch("stage_id").to_i
      genre = artist.fetch("genre")
      artists_array.push(Artist.new({:name => name, :stage_id => stage_id, :id => id, :genre => genre}))
    end
    artists_array
  end

  def save
    result = DB.exec("INSERT INTO artists (name, stage_id, genre) VALUES ('#{@name}', #{@stage_id}, '#{@genre}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    artist = DB.exec("SELECT * FROM artists WHERE id = #{id};").first
    name = artist.fetch("name")
    genre = artist.fetch("genre")
    stage_id = artist.fetch("stage_id").to_i
    id = artist.fetch("id").to_i
    Artist.new({:name => name, :stage_id => stage_id, :id => id, :genre => genre})
  end

  def update(name, genre, stage_id)
    @name = name
    @stage_id = stage_id
    @genre = genre
    DB.exec("UPDATE artists SET name = '#{@name}', stage_id = #{@stage_id}, genre = '#{@genre}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM artists WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM artists *;")
  end

  def self.find_by_stage(stage_id)
    artists_array = []
    returned_artists = DB.exec("SELECT * FROM artists WHERE stage_id = #{stage_id};")
    returned_artists.each() do |artist|
      name = artist.fetch("name")
      genre = artist.fetch("genre")
      id = artist.fetch("id").to_i
      artists_array.push(Artist.new({:name => name, :genre => genre, :stage_id => stage_id, :id => id}))
    end
    artists_array
  end

  def stage
    stage.find(@stage_id)
  end
end
