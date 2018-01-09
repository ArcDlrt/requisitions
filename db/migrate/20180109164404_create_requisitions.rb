class CreateRequisitions < ActiveRecord::Migration
  def change
    create_table :requisitions do |t|
      t.belongs_to :user
      t.decimal :income,                         null: false, default: 0, precision: 12, scale: 2
      t.integer :address_years,                  null: false, default: 0
      t.integer :company_years,                  null: false, default: 0
      t.string :marital_status,       limit: 15
      t.decimal :requested_amount,               null: false, default: 0, precision: 12, scale: 2
      t.integer :payment_terms,                  null: false, default: 0
      t.string :bank,                 limit: 70, null: false
      t.text   :comment
      t.string :company_name,         limit: 70
      t.string :company_phone_number, limit: 20
      t.integer :dependents_number,              null: false
      t.string :company_position
      t.boolean :has_sgmm
      t.boolean :has_imss
      t.boolean :has_car
      t.timestamps null: false
    end
  end
end
