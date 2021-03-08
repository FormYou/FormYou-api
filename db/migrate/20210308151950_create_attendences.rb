class CreateAttendences < ActiveRecord::Migration[6.1]
  def change
    create_table :attendences do |t|
      t.references :user, null: false, foreign_key: true
      t.references :session, null: false, foreign_key: true
      t.integer :note

      t.timestamps
    end
  end
end
