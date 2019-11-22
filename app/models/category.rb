class Category 
  include Neo4j::ActiveNode
  property :name, type: String

  has_many :in, :books, origin: :categories
end
