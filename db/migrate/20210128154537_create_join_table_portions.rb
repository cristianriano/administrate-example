# frozen_string_literal: true

class CreateJoinTablePortions < ActiveRecord::Migration[6.1]
  def change
    # create_join_table :cocktails, :ingredients, table_name: :portions do |t|
    #   t.index :cocktail_id
    #   t.index :ingredient_id

    #   t.string :measurement, null: false
    # end

    create_table :portions do |t|
      t.string :measurement, null: false
      t.references :cocktail, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :portions, %i[cocktail_id ingredient_id], unique: true
  end
end
