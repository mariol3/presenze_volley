class Participation < ActiveRecord::Base
  belongs_to :player
  belongs_to :training
  
  validates :note, length: { maximum: 140 }
end
