class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :visit_type
      t.text :obs
      t.date :date
      t.time :time
      t.integer :duration
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
