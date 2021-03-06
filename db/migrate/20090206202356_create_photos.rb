class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :parent_id, :size, :width, :height 
      t.string :content_type, :filename, :thumbnail, :caption
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
