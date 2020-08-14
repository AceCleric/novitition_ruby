class Competition < ApplicationRecord
  include UuidSupport

  belongs_to :sport
  has_many :games
end
