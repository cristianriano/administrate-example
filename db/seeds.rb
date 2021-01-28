# frozen_string_literal: true

# rubocop:disable all

margarita_id = Cocktail.upsert(
  {
    name: 'Margarita',
    description: 'A margarita is a Mexican cocktail consisting of tequila, orange liqueur, and lime juice often served with salt on the rim of the glass',
    instructions: 'Mix all the ingredients with ice in a cocktail shaker. Rim the glass with salt'
  },
  unique_by: :name
).first['id']

[
  ['Tequila', '2 Oz'],
  ['Cointreau', '1 Oz'],
  ['Lime juice', '1 Oz'],
  ['Salt', 'A bit']
].each do |name, measurement|
  ingredient = Ingredient.upsert({ name: name }, unique_by: :name).first
  next unless ingredient
  Portion.upsert(
    {cocktail_id: margarita_id, ingredient_id: ingredient['id'], measurement: measurement},
    unique_by: %i[cocktail_id ingredient_id]
  )
end

# rubocop:enable all
