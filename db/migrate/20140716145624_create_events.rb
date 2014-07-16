class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :reg_count
    end
  end
  
  def down
    drop_table :events
  end    
end
