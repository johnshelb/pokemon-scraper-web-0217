class Pokemon
  attr_accessor :id,:name,:type,:db, :hp
  def initialize(pokeHash)
    @id = pokeHash[:id]
    @name = pokeHash[:name]
    @type = pokeHash[:type]
    @db = pokeHash[:db]
    @hp = pokeHash[:hp]||nil

  end

  def self.save(name,type,db)
    sql = <<-SQL
    INSERT INTO pokemon(name,type) VALUES (?, ?)
    SQL
    db.execute(sql,name,type)
  end

  def self.find(id,db)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id = ?
    SQL
    poke = db.execute(sql,id)
    Pokemon.new(:id=>poke[0][0],:name=>poke[0][1],:type=>poke[0][2], :hp=>poke[0][3])
  end

  def alter_hp(newHp,db)
    sql= <<-SQL
    UPDATE pokemon SET hp = ? WHERE name = ?
    SQL
    db.execute(sql,newHp,self.name)

  end



end
