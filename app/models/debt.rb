class Debt < ApplicationRecord
  belongs_to :person

  validates :amount, presence: true, :numericality => { :greater_than_or_equal_to => 1 }
  self.per_page = 30

  after_create :update_person_balance

  private

  def update_person_balance
    person.update_balance()
  end
end
