class Training < ActiveRecord::Base
  attr_accessible :date
  has_many :participation
  has_many :player, through: :participation
end
