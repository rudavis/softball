class Game < ActiveRecord::Base
  belongs_to :player
  
  validates :at_bats, :runs, :hits, :singles, :doubles, :triples, :homeruns, :rbis, :walks, :total_bases, 
    :numericality => { :only_integer => true }, :length => { :maximum => 3 }
    
    def batting_average
        batting_average = (self.hits + self.doubles + self.triples + self.homeruns) / self.at_bats.to_f
    end
    def slugging_percentage
        (self.hits + self.doubles * 2 + self.triples * 3 + self.homeruns * 4) / self.at_bats.to_f
    end
    
    #TODO On Base %
    #<%= (game.hits + game.walks) / (game.total_bases + game.walks.to_f) %>
    

end
