class Player < ActiveRecord::Base
  validates :name, :presence => true
  has_many :games
  
  def at_bats
    games.all.sum(&:at_bats)
  end 
  def runs
    games.all.sum(&:runs)
  end  
  def hits
    games.all.sum(&:hits)
  end  
#Not going to use singles.
  def singles
    games.all.sum(&:singles)
  end  
  def doubles
    games.all.sum(&:doubles)
  end
  def triples
    games.all.sum(&:triples)
  end  
  def homeruns
    games.all.sum(&:homeruns)
  end
  def rbis
    games.all.sum(&:rbis)
  end  
  def walks
    games.all.sum(&:walks)
  end  
#Not going to use total bases  
  def total_bases
    games.all.sum(&:total_bases)
  end
  def num_games
    games.count
  end
  def batting_average
      (games.all.sum(&:hits) + games.all.sum(&:doubles) + games.all.sum(&:triples) + games.all.sum(&:homeruns)) / games.all.sum(&:at_bats).to_f
  end
  def slugging_percentage
      (games.all.sum(&:hits) + games.all.sum(&:doubles) * 2 + games.all.sum(&:triples) * 3 + games.all.sum(&:homeruns) * 4) / games.all.sum(&:at_bats).to_f
  end
  
#TODO On Baes %
  
  
end
