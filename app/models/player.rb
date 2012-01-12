class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :position, :bats, :throws, :notes
  #validates :name, :presence => true
  has_many :games
  belongs_to :team
  
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
  def strike_outs
    games.all.sum(&:strike_outs)
  end  
  def total_bases
    self.singles + self.doubles*2 + self.triples*3 + self.homeruns*4
  end
  def num_games
    games.count
  end
  def batting_average
    self.hits / self.at_bats.to_f
  end
  def slugging_percentage
    self.total_bases / self.at_bats.to_f
  end
  def on_base_percentage
    (self.hits + self.walks) / (self.total_bases + self.walks).to_f
  end
  
  
end
