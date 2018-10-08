class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.datetime :date
      t.string :location
      t.references :neighbourhood, foreign_key: true
      t.references :service_area, foreign_key: true
      t.references :service_request, foreign_key: true

      t.timestamps
    end
  end
end
