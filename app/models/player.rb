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
  def total_bases
    games.all.sum(&:total_bases)
  end
  
#		<td><%= @player.batting_average %></td>
#		<td><%= @player.on_base_percentage %></td>
#		<td><%= @player.slugging_percentage %></td>
  
  
end
