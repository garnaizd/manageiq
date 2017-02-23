class CreateShowbacks < ActiveRecord::Migration[5.0]
  def up
    create_table :showbacks do |t|
      t.bigint    :showback_configuration
      t.text      :data, :null => false
      t.timestamp :event_start
      t.timestamp :event_end
      t.timestamp :updated_at
      t.timestamp :created_at
      t.index     :id_object
      t.string    :type_object
    end
  end

  def down
    drop_table :showbacks
  end
end
