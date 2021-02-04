# frozen_string_literal: true

class Ingredient < ApplicationRecord
  # has_and_belongs_to_many :cocktails, join_table: :portions
  has_many :portions, dependent: :destroy
  has_many :cocktails, through: :portions

  validates :name, presence: true

  before_save :normalize

  private

  def normalize
    self.name = name.downcase
  end
end
