# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t = TrocaAkiValidation.where(name: "Troca Aki Campaign", code: "TTT").first_or_create
i = IpcValidation.where(name: "IPC Validation Campaign", code: "III").first_or_create

Role.find_or_create_by_name("vendor")
Role.find_or_create_by_name("activista")

30.times do
  u = User.create!
  u.roles.create(app_id: i.id, name: "activista")
  rand(15).times do
    c = Code.create(app_id: i.id, user_id: u.id)

    Sms.receive(
      SecureRandom.hex,
      "Movercado",
      c.to_s
    )

  end
end
