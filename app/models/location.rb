class Location < ActiveRecord::Base
  has_many :itemnames
  attr_accessible :nombre, :id
end
