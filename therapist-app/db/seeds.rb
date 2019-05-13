#create seed data for users and clients

#create users

lynie = User.create(name: "Lynie", email: "lynie@lynie.com", password: "password")
patrick = User.create(name: "Patrick", email: "patrick@patrick.com", password: "password")

#create clients

Client.create(first_name: "George", last_name: "Brown", date: "3/20", preferences: "Prefers hot table, start face up", content: "FBM, focus neck and shoulders", user_id: lynie.id)
Client.create(first_name: "Joey", last_name: "Smith", date: "3/18", preferences: "Prefers no heat, finish on face and scalp", content: "Upper body only, focus low back", user_id: lynie.id)

Client.create(first_name: "Jane", last_name: "Plain", date: "3/15", preferences: "Prefers medium heat, start face down", content: "FBM, relaxation", user_id: patrick.id)
Client.create(first_name: "Barbara", last_name: "Moore", date: "3/16", preferences: "Prefers hot table, T-pillow, finish feet", content: "FBM, focus legs and feet", user_id: patrick.id)
