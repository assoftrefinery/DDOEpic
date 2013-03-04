class Itemname < ActiveRecord::Base
  belongs_to :location
  attr_accessible :nombre, :id, :location_id
end
