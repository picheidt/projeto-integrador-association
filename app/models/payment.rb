class Payment < ApplicationRecord
  belongs_to :person

  validates :amount, presence: true, :numericality => { :greater_than_or_equal_to => 1 }
  self.per_page = 30
end
