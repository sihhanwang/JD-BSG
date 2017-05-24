class AddCategoryGroupIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :category_group_id, :integer
  end
end
