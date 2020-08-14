class Team < ApplicationRecord
  include UuidSupport
  belongs_to :competition
end
