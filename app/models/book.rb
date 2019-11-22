class Book < Asset 
  include Neo4j::ActiveNode
  id_property :isbn
  property :year_published, type: Integer

  has_one :in, :author, type: :CREATED, model_class: :User
  has_one :out, :category, type: :HAS_CATEGORY


end
