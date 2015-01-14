class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.references :group, index: true

      t.timestamps
    end
  end
end
