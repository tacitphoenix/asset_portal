class CreateBook < Neo4j::Migrations::Base
  def up
    add_constraint :Book, :isbn
  end

  def down
    drop_constraint :Book, :isbn
  end
end
