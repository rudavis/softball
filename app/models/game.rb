class Game < ActiveRecord::Base
  belongs_to :player
  
  validates :at_bats, :runs, :hits, :singles, :doubles, :triples, :homeruns, :rbis, :walks, :total_bases, 
    :numericality => { :only_integer => true }, :length => { :maximum => 3 }
    
end
