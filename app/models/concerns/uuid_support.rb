# frozen_string_literal: true

require 'active_support/concern'

module UuidSupport
  extend ActiveSupport::Concern

  included do
    before_create :set_uuid
  end

  def set_uuid
    self.id = SecureRandom.uuid if id.nil?
  end
end