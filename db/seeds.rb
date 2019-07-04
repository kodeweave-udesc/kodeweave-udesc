# Create Users
p "Create Users"

User.create!(
  name: "Coordenador 1",
  email: "adm@gmail.com",
  password: "nopasswd",
  owner: true,
  cpf: "111.111.111-11"
)

user1 = User.create!(
  name: "user 1",
  email: "user1@gmail.com",
  password: "nopasswd",
  owner: false,
  cpf: "222.222.222-22"
)

user2 = User.create!(
  name: "user 2",
  email: "user2@gmail.com",
  password: "nopasswd",
  owner: false,
  cpf: "333.333.333-33"
)

user3 = User.create!(
  name: "user 3",
  email: "user3@gmail.com",
  password: "nopasswd",
  owner: false,
  cpf: "444.444.444-44"
)

user4 = User.create!(
  name: "user 4",
  email: "user4@gmail.com",
  password: "nopasswd",
  owner: false,
  cpf: "555.555.555-55"
)

# Create Projects
p "Create Projects"

Project.create!(
  name: "teste 1",
  owner: user1,
  users: [user2, user4]
)

Project.create!(
  name: "teste 2",
  owner: user2,
  users: [user3, user4]
)

Project.create!(
  name: "teste 3",
  owner: user2,
  users: [user4],
  status: :in_progress
)

Project.create!(
  name: "teste 4",
  owner: user2,
  users: [user4],
  status: :late
)

Project.create!(
  name: "teste 5",
  owner: user2,
  users: [user4],
  status: :late
)

Project.create!(
  name: "teste 6",
  owner: user2,
  users: [user4],
  status: :finished
)
