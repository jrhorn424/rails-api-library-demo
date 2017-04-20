class SplitAuthorName < ActiveRecord::Migration[5.0]
  def up
    Author.all.each do |author|
      # we previously stored the full_name in family_name
      # it may have been better instead to make a transitory column
      parts = author.family_name.split(' ')
      author.given_name = if parts.length == 3
                            "#{parts[0]} #{parts[1]}"
                          else
                            parts.first
                          end
      author.family_name = parts.last
      author.save
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
