# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Role.create([{ rolle: 'Student' }, { rolle: 'Dozent' }, { rolle: 'Verwalter' }]) unless Role.find_by(rolle: 'Verwalter') != nil

verwalter_rolle = Role.find_by(rolle: 'Verwalter')
student_rolle = Role.find_by(rolle: 'Student')
dozent_rolle = Role.find_by(rolle: 'Dozent')

User.create(email: 'verwalter@chrono.de', password: 'Frosch23!', role: verwalter_rolle)
User.create(email: 'student@chrono.de', password: 'Frosch23!', role: student_rolle)
User.create(email: 'dozent@chrono.de', password: 'Frosch23!', role: dozent_rolle)

