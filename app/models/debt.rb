class Debt < ApplicationRecord
  belongs_to :person

  validates :amount, presence: true, :numericality => { :greater_than_or_equal_to => 1 }
  self.per_page = 30

  after_create :update_cache_balance
  before_create :update_value_to_negative

  private

  def update_value_to_negative
    self.amount = -amount
  end

  def update_cache_balance
    person.update_cache_balance(amount)
  end
end
