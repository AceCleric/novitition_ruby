class Sport < ApplicationRecord
  include UuidSupport

  has_many :competitions
end
