# Represents a real-world, purchaseable Item in the database
# just a name for now, may contain other information as it evolves
class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 32 }, allow_blank: false

  has_many :inventories
end
