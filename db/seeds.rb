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

# Person.destroy_all
User.destroy_all
# Debt.destroy_all


# User.create email: 'admin@admin.com', password: '111111'

# 50.times do 
#     FactoryBot.create(:user)
# end

# 100.times do
#     FactoryBot.create(:person) do |person|
#         person.user = User.order('random()').first
#     end
# end

# 500.times do 
#     FactoryBot.create(:debt) do |debt|
#         debt.person = Person.order('random()').first
#     end
# end

# puts "Usuário criado:"
# puts "login admin@admin.com"
# puts "111111"
