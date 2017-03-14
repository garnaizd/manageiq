class CreateTariffs < ActiveRecord::Migration[5.0]
  def up
    create_table :tariffs do |t|
      t.money :variable_cost
      t.money :fixed_cost
      t.string :title
      t.string :description

      t.timestamps
    end
  end

  def down
    drop_table :tariffs
  end
end
