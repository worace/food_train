class CreateTrainOptions < ActiveRecord::Migration
  def change
    create_table :train_options do |t|
      t.references :train, index: true
      t.string :place

      t.timestamps
    end
  end
end
