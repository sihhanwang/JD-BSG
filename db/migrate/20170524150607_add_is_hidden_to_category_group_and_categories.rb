class AddIsHiddenToCategoryGroupAndCategories < ActiveRecord::Migration[5.0]
  def change
    # 修改  category_groups，新增 is_hidden
    add_column :category_groups, :is_hidden, :boolean, default: true
    # 修改 categories，新增is_hidden
    add_column :categories, :is_hidden, :boolean, default: true

  end
end
