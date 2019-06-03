class User
  def initialize(name, age)
    @name = name
    @age = age
  end

  def insert
    postgresql.insert(attributes)
  end

  def attributes
    {name: @name, age: @age}
  end

  private
    def postgresql
      @postgresql ||= PostgreSql.new
    end
end

# Postgresql に接続するクライアント
class PostgreSql
  def insert(attributes)
    # do something
  end
end
