class Sport < ApplicationRecord
  include UuidSupport

  belongs_to :competition
end
