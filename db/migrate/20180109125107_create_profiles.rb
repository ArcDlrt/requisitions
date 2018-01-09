class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :first_name,       limit: 50, null: false, default: ""
      t.string :second_name,      limit: 50
      t.string :second_last_name, limit: 50
      t.string :first_last_name,  limit: 50, null: false, default: ""
      t.date   :birth_date                 , null: false
      t.string :curp,             limit: 18, null: false, default: ""
      t.string :rfc,              limit: 13, null: false, default: ""
      t.string :gender,           limit: 1
      t.string :birth_state,      limit: 50
      t.string :phone_number,     limit: 20, null: false, default: ""

      t.timestamps null: false
    end
  end
end
