class CreateFormations < ActiveRecord::Migration[6.1]
  def change
    create_table :formations do |t|
      t.string :title
      t.string :description
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
