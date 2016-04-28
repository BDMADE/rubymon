class Team < ActiveRecord::Base
  belongs_to :user

  ## validation
  validates :name, presence: true
end
