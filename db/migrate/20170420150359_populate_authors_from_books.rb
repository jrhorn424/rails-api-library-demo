class PopulateAuthorsFromBooks < ActiveRecord::Migration[5.0]
  def up
    # add name data to family_name for splitting later
    execute <<~EOS
      INSERT INTO authors(family_name, created_at, updated_at)
      SELECT DISTINCT author, current_timestamp, current_timestamp
      FROM books
      ORDER BY author;
    EOS
  end

  def down
    execute <<~EOS
      DELETE FROM authors;
    EOS
  end
end
