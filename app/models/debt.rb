class Debt < ApplicationRecord
  belongs_to :person

  validates :amount, presence: true
  self.per_page = 30
end
