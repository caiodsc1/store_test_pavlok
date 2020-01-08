class EnableTrigramExtension < ActiveRecord::Migration[5.2]
  def change
    connection.execute('create extension if not exists "pg_trgm"')
  end
end
