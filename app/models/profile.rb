class Profile < ActiveRecord::Base

  belongs_to :user

  validates :first_name, presence: true
  validates :first_last_name, presence: true
  validates :curp, presence: true, length: { is: 18 }
  validates :rfc, presence: true, length: { is: 13 }
  validates :birth_date, presence: true
  validates :gender, presence: true
  validates :phone_number, presence: true, format: { with: /\A[\d-]*\z/, message: "eg: 33-333-3333" }


end
