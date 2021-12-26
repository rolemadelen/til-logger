class AddArchiveColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :archive, :boolean, :default => false
  end
end
