class Mission < ActiveRecord::Base
  belongs_to :crew_id
  belongs_to :captain_id
  attr_accessible :name, :objective
end
