class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.integer :attendee_id
      t.boolean :log_type ,default: false
      t.string :datetime
      t.boolean :completed ,default: false

      t.timestamps
    end
  end
end
