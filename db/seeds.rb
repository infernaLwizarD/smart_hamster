# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def create_roles
  return unless Role.all.empty?

  Role.create!([{ label: 'Админ' }, { label: 'Родитель' }, { label: 'Хомяк' }])
end

def create_users
  User.create!(
    role_id: Role::ADMIN,
    username: 'admin',
    password: '1q2w3e4r',
    email: 'smart_hamster_admin@admin.com',
    confirmed_at: Time.zone.now
  )
end

create_roles
create_users
