class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.integer :duration
      t.datetime :date
      t.belongs_to :formation, index: true
      t.belongs_to :room, index: true

      t.timestamps
    end
  end
end
