# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :title, presence: true, length: { within: (10..100) }, uniqueness: true
end
