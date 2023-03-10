class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: "creator_id"
    has_many :attendees, through: :attendances, source: :user
    has_many :attendances, dependent: :destroy
end
