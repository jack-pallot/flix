class ChangeMoviesColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :released_at, :released_on
  end
end
