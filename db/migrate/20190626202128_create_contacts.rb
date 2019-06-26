class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :contactee_id
      t.integer :meet_cycle, default: 0
      t.integer :call_cycle, default: 0

      t.timestamps
    end
  end
end
