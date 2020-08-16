class Prediction < ApplicationRecord
  include UuidSupport

  belongs_to :user
  belongs_to :team
end
