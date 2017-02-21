class Pokemon
  attr_reader :id, :name, :type, :db
  def initialize(arg)
    @id=arg[:id]
    @name=arg[:name]
    @type=arg[:type]
    @db=arg[:db]
  end

  def self.save(a,b,c)
    c.execute("INSERT INTO pokemon (name, type) VALUES(?,?)",a,b)
  end

  def self.find(id_num,db)
    new_pok = db.execute("SELECT * FROM pokemon WHERE id=?",id_num).flatten
    x=Pokemon.new({id:new_pok[0],name:new_pok[1],type:new_pok[2]})
  end

end
