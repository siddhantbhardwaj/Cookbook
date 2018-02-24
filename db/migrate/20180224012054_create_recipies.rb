class CreateRecipies < ActiveRecord::Migration[5.1]
  def change
    create_table :recipies do |t|
      t.string :title
      t.text :ingredients
      t.text :description
      t.text :instruction
      t.text :link
      t.integer :user_id

      t.timestamps
    end
  end
end
