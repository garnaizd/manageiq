class CreateTarifes < ActiveRecord::Migration[5.0]
  def up
    create_table :tarifes do |t|
      t.integer :id_tarife
      t.money :variable_cost
      t.money :fixed_cost
      t.string :array_rates
      t.string :title
      t.string :description

      t.timestamps
    end
  end

  def down
    drop_table :tarifes
  end
end
