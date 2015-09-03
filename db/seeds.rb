# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in 0..1000
  @author = Author.create({ fio: 'Author fio '+i.to_s })
  k = rand(15..25)
  for n in 0..k
    subyear = rand(0..20)+n
    title = Faker::Lorem.sentence(rand(2..10)).chomp('.')
    Book.create( { title: title+' '+subyear.to_s+' ' , year: 2000+subyear , author: @author  })
  end
end