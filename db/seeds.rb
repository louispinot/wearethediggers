# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#seed pictures.json into db

# json = ActiveSupport::JSON.decode(File.read("db/pictures.json"))
# json['collection1'].each do |p|
#   ref = p['name']
#   description = p['description']
#   author = p['author']
#   date = p['date']
#   place = p['place']
#   copyrights_owner = p['copyrights_owner']
#   picture_url = "https://s3-eu-west-1.amazonaws.com/thuillier-collection/#{ref}.JPG"
#   Picture.create!(picture_url: picture_url, ref: ref, author: author, place: place, copyrights_owner: copyrights_owner, description: description, date: date)
# end


# # json = ActiveSupport::JSON.decode(File.read("db/soldiers.json"))
# #   json['collection1'].each do |s|
# #     first_name = s['scrap_name'][17..-1].split[-1]
# #     last_name = s['scrap_name'][17..-1].split[0..-2].join(" ")
# #     rank = s['rank']
# #     unit = s['unit']
# #     date_of_death = s['date_of_death']
# #     place_of_death = s['place_of_death']
# #     cemetery = s['cemetery']
# #     source = s['source']
# #     service_number = s['service_number']
# #     Soldier.create!(first_name: first_name, last_name: last_name, service_number: service_number, rank: rank, unit: unit, date_of_death: date_of_death, place_of_death: place_of_death, cemetery: cemetery, source: source)
# #   end





# user = User.create(email: "admin@admin.com", password: "0000", superuser: true, admin: true)