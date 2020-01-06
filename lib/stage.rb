class Stage
  attr_reader :id, :name, :location

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @location = attributes.fetch(:location)
  end

  def self.all
    returned_stages = DB.exec("SELECT * FROM stages;")
    stages = []
    returned_stages.each() do |stage|
      name = stage.fetch("name")
      location = stage.fetch("location")
      id = stage.fetch("id").to_i
      stages.push(Stage.new({:name => name, :id => id, :location => location}))
    end
    stages
  end

  def save
    result = DB.exec("INSERT INTO stages (name, location) VALUES ('#{@name}', '#{@location}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(stage_to_compare)
    self.name().downcase().eql?(stage_to_compare.name.downcase()) &&
    self.location().downcase().eql?(stage_to_compare.location.downcase())
  end

  def self.clear
    DB.exec("DELETE FROM stages *;")
  end

  def self.find(id)
    stage = DB.exec("SELECT * FROM stages WHERE id = #{id}").first
    name = stage.fetch("name")
    id = stage.fetch("id").to_i
    location = stage.fetch("location")
    Stage.new({:name => name, :id => id, :location => location})
  end

  def self.search(stage_name)
    stages_array = []
    returned_stages = DB.exec("SELECT * FROM stages WHERE name LIKE '#{stage_name}%';")
    returned_stages.each() do |stage|
      location = stage.fetch("location")
      name = stage.fetch("name")
      id = stage.fetch("id").to_i
      stages_array.push(Stage.new({:name => name, :id => id, :location => location}))
    end
    stages_array
  end

  def artists
    Artist.find_by_stage(self.id)
  end

  def update(name, location)
    @name = name
    @location = location
    DB.exec("UPDATE stages SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM stages WHERE id = #{@id};")
  end

end
