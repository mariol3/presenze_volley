class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Player < ActiveRecord::Base
  ROLES = %w[user admin] #order in ascendent level of ability

  before_save :default_values
  before_create { generate_token(:auth_token) }
  has_many :participations, dependent: :destroy
  has_many :trainings, through: :participations
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 25 }
  validates :email, presence:true, uniqueness: true, email: true
  
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

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Player.exists?(column => self[column])
  end

end
