class FillRoles < ActiveRecord::Migration[7.0]
  def change
    Role.create(label: "Администратор")
    Role.create(label: "Родитель")
    Role.create(label: "Хомяк")
  end
end
