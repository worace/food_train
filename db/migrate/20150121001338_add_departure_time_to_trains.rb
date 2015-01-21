class AddDepartureTimeToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :departure_time, :time
  end
end
