class AddRegFee < ActiveRecord::Migration
  def change
    add_column :events, :registration_fee, :decimal
  end
end
