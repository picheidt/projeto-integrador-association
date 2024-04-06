# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require 'cpf_cnpj'

puts "Destroying existing records..."
User.destroy_all
Debt.destroy_all
Person.destroy_all

User.create email: 'admin@admin.com', password: '111111'

puts "Usuário criado:"
puts "login admin@admin.com"
puts "111111"

1000.times do |counter|
  puts "Creating user #{counter}"
  FactoryBot.create(:user)
end

3000.times do |counter|
  puts "Inserting Person #{counter}"

  person = FactoryBot.create(:person, user: User.order('random()').first)

  5.times do |counter|
    puts "Insertin Debt #{counter}"
    FactoryBot.create(:debt, person: person)
    puts "Insertin Payment #{counter}"
    FactoryBot.create(:payment, person: person)
  end
end