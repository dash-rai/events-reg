class CreateCategory < ActiveRecord::Migration
  def change

    create_table :categories do |t|
      t.string :name
    end

    change_table :events do |t|
      t.references :category
    end
    
  end
end
