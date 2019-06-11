# Create Accounts
p "Create Accounts"

udesc = Account.create!(name: "Udesc")

# Create Users
p "Create Users"

User.create!(
  name: "Administrador 1",
  email: "adm@gmail.com",
  password: "nopasswd",
  account: udesc,
  owner: true,
  cpf: "111.111.111-11"
)

User.create!(
  name: "user 1",
  email: "user1@gmail.com",
  password: "nopasswd",
  account: udesc,
  owner: false,
  cpf: "222.222.222-22"
)

User.create!(
  name: "user 2",
  email: "user2@gmail.com",
  password: "nopasswd",
  account: udesc,
  owner: false,
  cpf: "333.333.333-33"
)
