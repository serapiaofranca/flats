class AddParkingSlotsDailyRateToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :parking_slot, :boolean
    add_column :properties, :daily_rate, :decimal
  end
end
