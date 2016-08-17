class Team < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_and_belongs_to_many :users
end
