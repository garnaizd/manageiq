class CreateShowbackRates < ActiveRecord::Migration[5.0]
  def up
    create_table :showback_rates do |t|
      t.money :fixed_cost,    :null => false
      t.money :variable_cost, :null => false,  :default => Money.new(0, "EUR")
      t.datetime :date
      t.string :concept

      t.timestamps
    end
  end

  def down
    drop_table :showback_rates
  end
end
