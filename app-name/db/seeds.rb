#create seed data for users and clients

lynie = User.create(name: "Lynie", email: "lynie@lynie.com", password: "password")
patrick = User.create(name: "Patrick", email: "patrick@patrick.com", password: "password")

Client.create(first_name: "George", last_name: "Brown", date: "3/20", content: "Prefers hot table, start face up", user_id: lynie.id)
Client.create(first_name: "Joey", last_name: "Smith", date: "3/18", content: "Prefers no heat, finish on face and scalp", user_id: lynie.id)

Client.create(first_name: "Jane", last_name: "Plain", date: "3/15", content: "Prefers medium heat, start face down", user_id: patrick.id)
Client.create(first_name: "Barbara", last_name: "Moore", date: "3/16", content: "Prefers hot table, T-pillow, finish feet", user_id: patrick.id)
