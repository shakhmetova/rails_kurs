if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

d1 = Departament.create(name: "Департамент1")
d2 = Departament.create(name: "Департамент2")
d3 = Departament.create(name: "Департамент3")
d4 = Departament.create(name: "Департамент4")
d5 = Departament.create(name: "Департамент5")

w1 = Worker.create(fn: 'Имя1', ln: 'Фам1', sn: 'Отч1',
                  passport_num: '11111', passport_ser: '111111',
                  birthday: Time.now(), post: 'Пост1', departament_id: d1.id)
w2 = Worker.create(fn: 'Имя2', ln: 'Фам2', sn: 'Отч2',
                  passport_num: '22222', passport_ser: '222222',
                  birthday: Time.now(), post: 'Пост2', departament_id: d2.id)
w3 = Worker.create(fn: 'Имя3', ln: 'Фам3', sn: 'Отч3',
                  passport_num: '33333', passport_ser: '333333',
                  birthday: Time.now(), post: 'Пост3', departament_id: d3.id)
w4 = Worker.create(fn: 'Имя4', ln: 'Фам4', sn: 'Отч4',
                  passport_num: '44444', passport_ser: '444444',
                  birthday: Time.now(), post: 'Пост4', departament_id: d4.id)
w5 = Worker.create(fn: 'Имя5', ln: 'Фам5', sn: 'Отч5',
                  passport_num: '55555', passport_ser: '555555',
                  birthday: Time.now(), post: 'Пост5', departament_id: d5.id)

p1 = Project.create(name: 'Проект1', date_start: Time.now(),
                    date_finish: Time.now() + 999, price: 700)
p2 = Project.create(name: 'Проект2', date_start: Time.now(),
                    date_finish: Time.now() + 999, price: 300)
p3 = Project.create(name: 'Проект3', date_start: Time.now(),
                    date_finish: Time.now() + 999, price: 500)


w1.projects << p1 << p2
w3.projects << p3
w4.projects << p2 << p3
w5.projects << p1 << p2 << p3
