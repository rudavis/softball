class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Paperclip image
  has_attached_file :avatar, :styles => { :thumb => "200x200>", :large => "500x500>" }, :processors => [:cropper]
  after_update :reprocess_avatar, :if => :cropping?
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :position, :bats, :throws, :notes, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :avatar, :crop_x, :crop_y, :crop_w, :crop_h

  has_many :games, :order => "date desc"
  
  def at_bats(*yr)
    yr.first.blank? ? games.all.sum(&:at_bats) : games.for_year(yr.first).sum(:at_bats)
  end 
  
  def runs(*yr)
    yr.first.blank? ? games.all.sum(&:runs) : games.for_year(yr.first).sum(:runs)
  end  
  
  def hits(*yr)
    yr.first.blank? ? games.all.sum(&:hits) : games.for_year(yr.first).sum(:hits)
  end
  
  def singles(*yr)
    yr.first.blank? ? games.all.sum(&:singles) : games.for_year(yr.first).sum(:singles)
  end  
  
  def doubles(*yr)
    yr.first.blank? ? games.all.sum(&:doubles) : games.for_year(yr.first).sum(:doubles)
  end
  
  def triples(*yr)
    yr.first.blank? ? games.all.sum(&:triples) : games.for_year(yr.first).sum(:triples)
  end  
  
  def homeruns(*yr)
    yr.first.blank? ? games.all.sum(&:homeruns) : games.for_year(yr.first).sum(:homeruns)
  end
  
  def rbis(*yr)
    yr.first.blank? ? games.all.sum(&:rbis) : games.for_year(yr.first).sum(:rbis)
  end  

  def walks(*yr)
    yr.first.blank? ? games.all.sum(&:walks) : games.for_year(yr.first).sum(:walks)
  end  
  
  def strike_outs(*yr)
    yr.first.blank? ? games.all.sum(&:strike_outs) : games.for_year(yr.first).sum(:strike_outs)
  end  

  def num_games(*yr)
    yr.first.blank? ? games.count : games.for_year(yr.first).count
  end
  
  def total_bases
    self.singles + self.doubles*2 + self.triples*3 + self.homeruns*4
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

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def reset_crop
    self.crop_w = nil
  end
  
  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end
    
  private
    def reprocess_avatar
      avatar.reprocess!
    end
end
