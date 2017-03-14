class CreateShowbackRates < ActiveRecord::Migration[5.0]
  def up
    create_table :showback_rates do |t|
      t.money :rating
      t.datetime :date
      t.string :concept

      t.timestamps
    end
  end

  def down
    drop_table :showback_rates
  end
end
