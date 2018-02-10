class CreateComents < ActiveRecord::Migration
  def change
     create_table :comments do |t|
      t.integer :idea_id
      t.text :description
      t.string :author

      t.timestamps null: false
    end
  end
end
