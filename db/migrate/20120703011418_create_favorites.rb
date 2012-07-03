class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :repo_id
      t.string :repo_name
      t.string :repo_url
      t.text :repo_description
      t.references :user

      t.timestamps
    end
    add_index :favorites, :user_id
  end
end
