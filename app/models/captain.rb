class Captain < ActiveRecord::Base
  attr_accessible :name

  has_many :missions
  has_many :crews, :through => :missions
end

