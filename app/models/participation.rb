class Participation < ActiveRecord::Base
  belongs_to :player
  belongs_to :training
  

  validates :player_id, uniqueness: { scope: :training_id }
  validates :training_id, uniqueness: { scope: :player_id }
  validates :note, length: { maximum: 140 }
end
