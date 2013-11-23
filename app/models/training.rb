class Training < ActiveRecord::Base
  has_many :participation
  has_many :player, through: :participation
  
  validates :date, uniqueness: true, presence: true

end
