class Room < ApplicationRecord
  belongs_to :team
  has_many :messages

  def self.create_default_rooms(team)
      Room.create(name: "general", team: team)
  end
end
