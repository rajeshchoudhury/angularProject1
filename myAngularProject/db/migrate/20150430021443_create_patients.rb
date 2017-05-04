class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :address
      t.date :birth
      t.string :phone
      t.string :birthplace
      t.string :civilstate
      t.string :skin
      t.boolean :special_patient
      t.string :email
      t.string :sex
      t.text :obs

      t.timestamps null: false
    end
  end
end
