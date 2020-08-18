class Sport < ApplicationRecord
  include UuidSupport

  has_many :competitions
  has_one_attached :image
end
