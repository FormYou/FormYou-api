class CreateAssignementCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :assignement_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :formation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
