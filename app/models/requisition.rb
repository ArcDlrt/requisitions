class Requisition < ActiveRecord::Base

  belongs_to :user

  scope :my_requisitions, -> (user_id){ where(user_id: user_id) }

  validates :income,        presence: true, numericality: { greater_than: 0 }
  validates :address_years, presence: true, numericality: { only_integer: true }
  validates :company_years, presence: true, numericality: { only_integer: true }
  validates :requested_amount, presence: true, numericality: { greater_than: 0 }
  validates :payment_terms, presence: true, numericality: { only_integer: true }
  validates :bank, presence: true
  validates :company_name, presence: true

end
