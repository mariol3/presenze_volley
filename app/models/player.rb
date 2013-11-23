class Player < ActiveRecord::Base
  ROLES = %w[user admin] #order in ascendent level of ability

  before_save :default_values
  has_many :participation
  has_many :training, through: :participation
  
  validates :name, presence: true, uniqueness: true
  
  has_secure_password
  
  def default_values
    if (!self.avatar_url || self.avatar_url.empty?)
      self.avatar_url = 'default_avatar.png'
    end
    
    if(!self.role || self.role.empty?)
      self.role = ROLES[0] # lowest level of ability
    end
  end
end
