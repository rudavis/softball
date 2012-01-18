class Game < ActiveRecord::Base
  belongs_to :player
  
  validates :at_bats, :runs, :hits, :singles, :doubles, :triples, :homeruns, :rbis, :walks, 
    :numericality => { :only_integer => true }, :length => { :maximum => 3 }

    def total_bases
      self.singles + self.doubles * 2 + self.triples * 3 + self.homeruns * 4
    end
    
    def batting_average
        self.hits / self.at_bats.to_f
    end
    def slugging_percentage
        self.total_bases / self.at_bats.to_f
    end
    def on_base_percentage
        (self.hits + self.walks) / (self.total_bases + self.walks.to_f)
    end
end
