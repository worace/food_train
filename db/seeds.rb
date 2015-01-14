# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative '../test/alex_factory'
include AlexFactory

trevr       = create_user full_name: "Trevr"
trevr2      = create_user full_name: "Trevoroni"
et          = create_user full_name: "ET"
greg        = create_user full_name: "Grejory Garageka"
yolo_master = create_user full_name: "YoloMaster"
yoda        = create_user full_name: "Yoda"
jorge       = create_user full_name: "Jorge Jispano"
puts "Users created"

turing_1408 = create_group name: "Turing 1408", owner: jorge
jedis       = create_group name: "Jedis", owner: yoda
pizza_train = create_group name: "Pizza Only", owner: trevr
hype_train  = create_group name: "Hype ヽ༼ຈل͜ຈ༽ﾉ ヽ༼ຈل͜ຈ༽ﾉ ", owner: yolo_master

turing_1408.users += [trevr, trevr2, greg]
jedis.users       += [yolo_master, et, jorge]
pizza_train.users += [trevr2, yolo_master]
puts "Groups created"

create_train group: turing_1408 do |train|
  train.train_options.build place: "Pizza"
  train.train_options.build place: "Jorge"
  train.train_options.build place: "Crazy"
end

create_train group: jedis do |train|
  train.train_options.build place: "Jedi Food"
  train.train_options.build place: "Coal"
end

create_train group: pizza_train do |train|
  train.train_options.build place: "Pizza"
  train.train_options.build place: "Pizza"
  train.train_options.build place: "Pizza"
  train.train_options.build place: "Just Vote For Pizza"
end

puts "Trains created"
