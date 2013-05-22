class Crew < ActiveRecord::Base
  attr_accessible :name, :starship

  has_many :missions
  has_many :captains, :through => :missions
end
