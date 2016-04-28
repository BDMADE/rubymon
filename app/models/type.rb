class Type < ActiveRecord::Base
  #validation
  validates :name,presence: true
  validates :power, presence: true
end
