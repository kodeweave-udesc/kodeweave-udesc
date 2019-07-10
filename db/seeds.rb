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

proj1 = Project.create!(
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

Task.create!(
  name: "tarefa 01",
  project: proj1,
  status: :in_progress,
  goals_end_at: Time.current + 5.days,
  goals_start_at: Time.current - 5.days,
  real_start_at: Time.current - 4.days,
  obs: "observação",
  full_detailing: "completo aksjdlasjdkasjd kasj dlkasj ldkaj slkdajs lkasjdlkasjl djaslkd jaslk djkalsdj ",
  short_detailing: "parcial alsdjas as s adas ads ",
  user: user4
)

Task.create!(
  name: "tarefa 02",
  project: proj1,
  status: :in_progress,
  goals_end_at: Time.current + 5.days,
  goals_start_at: Time.current - 5.days,
  real_start_at: Time.current - 4.days,
  obs: "observação",
  full_detailing: "completo aksjdlasjdkasjd kasj dlkasj ldkaj slkdajs lkasjdlkasjl djaslkd jaslk djkalsdj ",
  short_detailing: "parcial alsdjas as s adas ads ",
  user: user3
)

Task.create!(
  name: "tarefa 03",
  project: proj1,
  status: :in_progress,
  goals_end_at: Time.current + 5.days,
  goals_start_at: Time.current - 5.days,
  real_start_at: Time.current - 4.days,
  obs: "observação",
  full_detailing: "completo aksjdlasjdkasjd kasj dlkasj ldkaj slkdajs lkasjdlkasjl djaslkd jaslk djkalsdj ",
  short_detailing: "parcial alsdjas as s adas ads ",
  user: user2
)

Task.create!(
  name: "tarefa 04",
  project: proj1,
  status: :in_progress,
  goals_end_at: Time.current + 5.days,
  goals_start_at: Time.current - 5.days,
  real_start_at: Time.current - 4.days,
  obs: "observação",
  full_detailing: "completo aksjdlasjdkasjd kasj dlkasj ldkaj slkdajs lkasjdlkasjl djaslkd jaslk djkalsdj ",
  short_detailing: "parcial alsdjas as s adas ads ",
  user: user4
)
