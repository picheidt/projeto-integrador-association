class Person < ApplicationRecord
  belongs_to :user, optional: true

  has_many :debts, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates :name, :national_id, presence: true
  validates :national_id, uniqueness: true
  validate :cpf_or_cnpj
  
  def balance
    Rails.cache.fetch("#{id}/balance", expires_in: 30.minutes) do 
      debts.sum(:amount) + payments.sum(:amount)
    end
  end

  def update_cache_balance(amount)
    new_balance = balance() + amount
    Rails.cache.write("#{id}/balance", new_balance)
  end


  self.per_page = 10

  private

  def cpf_or_cnpj
    if !CPF.valid?(national_id) && !CNPJ.valid?(national_id)
      errors.add :national_id, :invalid
    end
  end
end
