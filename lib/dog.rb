class Dog 
  attr_accessor :name, :breed 
  attr_reader :id
  
  def initialize(id:nil, name:, breed:)
    @id = id
    @name = name
    @breed = breed
  end
  
  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS dogs(name, breed);"
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = "DROP TABLE IF EXISTS dogs;"
    DB[:conn].execute(sql)
  end
  
  def new_from_db(row)
    id = row[0]
    name = row[1]
    breed = row[2]
    Dog.new(id:id, name:name, breed:breed)
  end
  
end