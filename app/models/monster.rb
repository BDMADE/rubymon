class Monster < ActiveRecord::Base
  belongs_to :type
  belongs_to :team
  belongs_to :user
  # validation
  validates :name, presence: true
  validates :type_id, presence: true
  validates :team_id, presence: true
end
