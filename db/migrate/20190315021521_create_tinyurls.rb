class CreateTinyurls < ActiveRecord::Migration[5.2]
  def change
    create_table :tinyurls do |t|
      t.string :original_url
      t.string :tiny_url
      t.datetime :expiration
      t.integer :used_count, :default => 0
      t.timestamps
    end
    add_index :tinyurls, :tiny_url, unique: true
  end
end
