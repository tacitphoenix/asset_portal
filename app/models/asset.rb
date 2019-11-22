class Asset 
  include Neo4j::ActiveNode
  property :title, type: String



end
