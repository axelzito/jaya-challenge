# frozen_string_literal: true

class Issue < ApplicationRecord
  has_many :events, dependent: :destroy
end
