# frozen_string_literal: true

class CreateCocktailsAndIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :cocktails do |t|
      t.string :name, index: { unique: true }
      t.text :description
      t.text :instructions, null: false

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    create_table :ingredients do |t|
      t.string :name, index: { unique: true }

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
