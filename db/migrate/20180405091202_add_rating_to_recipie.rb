class AddRatingToRecipie < ActiveRecord::Migration[5.1]
  def change
    add_column :recipies, :rating, :float, default: 0
  end
end
