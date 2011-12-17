class Game < ActiveRecord::Base
  belongs_to :player
  
  validates :at_bats, :runs, :hits, :singles, :doubles, :triples, :homeruns, :rbis, :walks, :total_bases, 
    :numericality => { :only_integer => true }, :length => { :maximum => 3 }
    
    def batting_average
        batting_average = (self.hits + self.doubles + self.triples + self.homeruns) / self.at_bats.to_f
    end
    def slugging_percentage
        slugging_percentage = self.total_bases / self.at_bats.to_f
    end
    def on_base_percentage
        on_base_percentage = (self.hits + self.walks) / (self.total_bases + self.walks.to_f)
    end
    def total_bases
      total_bases = self.hits + self.doubles * 2 + self.triples * 3 + self.homeruns * 4
    end
end
