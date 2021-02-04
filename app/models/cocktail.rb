# frozen_string_literal: true

class Cocktail < ApplicationRecord
  has_many :portions, dependent: :destroy
  has_many :ingredients, through: :portions

  validates :name, :instructions, presence: true

  before_save :normalize

  def ingredients_with_amounts
    ingredients.select('ingredients.*, portions.measurement')
  end

  private

  def normalize
    self.name = name.downcase
  end
end
