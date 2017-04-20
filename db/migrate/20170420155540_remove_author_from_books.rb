class RemoveAuthorFromBooks < ActiveRecord::Migration[5.0]
  def up
    remove_column :books, :author, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
