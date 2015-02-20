class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :marker_type
      t.text :marker_content
      t.decimal :lat, :precision => 10, :scale => 6
      t.decimal :lng, :precision => 10, :scale => 6

      t.timestamps
    end
  end
end
