class Mission < ActiveRecord::Base
  belongs_to :captain
  belongs_to :crew
  attr_accessible :name, :objective
end
