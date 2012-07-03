class RemoveRepoIdFromFavorites < ActiveRecord::Migration
  def up
    remove_column :favorites, :repo_id
      end

  def down
    add_column :favorites, :repo_id, :integer
  end
end
