class ChangeTagsToArrayInItems < ActiveRecord::Migration[7.1]
  def change
    change_column :items, :tags, :text
  end
end
