# frozen_string_literal: true

class Portion < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :measurement, presence: true
end
