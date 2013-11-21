class Player < ActiveRecord::Base
  has_many :participation
  has_many :training, through: :participation
  
  validates :name, presence: true, uniqueness: true
  
  has_secure_password
end
