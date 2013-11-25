class Training < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :players, through: :participations
  
  validates :date, uniqueness: true, presence: true

end
