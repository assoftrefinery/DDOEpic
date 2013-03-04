class Item < ActiveRecord::Base
  belongs_to :user

  belongs_to :itemname
  belongs_to :location
  attr_accessible :base, :nombre, :scroll, :seal, :shard, :user_id, :location_id, :itemname_id
end
