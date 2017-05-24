# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "admin@test.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save

# 新增類型  Category #
   CategoryGroup.create!(
     name: '運動課程'
   )

   CategoryGroup.create!(
     name: '運動用品'
   )

   CategoryGroup.create!(
     name: '飲食專區'
   )

   puts '創建類型*3：運動課程、運動用品、飲食專區'

 # 新增分類  Category #
   # 運動課程
   # 1
   Category.create!(
     category_group_id: 1,
     name: '有氧運動'
   )

   # 2
   Category.create!(
     category_group_id: 1,
     name: '團體運動'
   )

   # 3
   Category.create!(
     category_group_id: 1,
     name: '核心訓練'
   )


   puts '創建「運動課程」分類*3：有氧運動、團體運動、核心訓練'

   # 運動用品
   # 4
   Category.create!(
     category_group_id: 2,
     name: '鞋款'
   )

   # 5
   Category.create!(
     category_group_id: 2,
     name: '服飾-TOP'
   )

   # 6
   Category.create!(
     category_group_id: 2,
     name: '服飾-BOTTOM'
   )

   # 7
   Category.create!(
     category_group_id: 2,
     name: '裝飾與配件'
   )

   puts '創建「運動用品」分類*4：鞋款、服飾-TOP、服飾-BOTTOM、裝飾與配件'

   # 飲食專區
   # 8
   Category.create!(
     category_group_id: 3,
     name: '熱量調控餐'
   )
   # 9
   Category.create!(
     category_group_id: 3,
     name: '女性專用營養品'
   )
   # 10
   Category.create!(
     category_group_id: 3,
     name: '瘦身嘴饞零嘴'
   )

   puts '創建「飲食專區」分類*3：熱量調控餐、女性專用營養品、瘦身嘴饞零嘴'
