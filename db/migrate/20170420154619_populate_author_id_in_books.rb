class PopulateAuthorIdInBooks < ActiveRecord::Migration[5.0]
  # for db:migrate
  def up
    execute <<~EOS
      UPDATE books
      SET author_id = authors.id
      FROM authors
      WHERE books.author = authors.family_name;
    EOS
  end

  # for db:rollback
  def down
    execute <<~EOS
      UPDATE books
      SET author_id = NULL;
    EOS
  end
end
