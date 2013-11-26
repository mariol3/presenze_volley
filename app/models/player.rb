class Player < ActiveRecord::Base
  ROLES = %w[user admin] #order in ascendent level of ability

  before_save :default_values
  has_many :participations, dependent: :destroy
  has_many :trainings, through: :participations
  
  validates :name, presence: true, uniqueness: true
  
  has_secure_password
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default_avatar.png"
  validates_attachment :avatar, content_type: { content_type: 'image/jpg', content_type: 'image/png' },
                                size: { in: 0..512.kilobytes }
  
  def default_values
    if (!self.avatar_url || self.avatar_url.empty?)
      self.avatar_url = 'default_avatar.png'
    end
    
    if(!self.role || self.role.empty?)
      self.role = ROLES[0] # lowest level of ability
    end
  end

end
