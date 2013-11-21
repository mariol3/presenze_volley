class Player < ActiveRecord::Base
  attr_accesible :name, :password, :password_confirmation
  has_many :participation
  has_many :training, through: :participation
  
  validates :name, presence: true, uniqueness: true
  
  has_secure_password
end
