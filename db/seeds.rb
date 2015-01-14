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

turing_1408 = create_group name: "Turing 1408", owner: jorge
jedis       = create_group name: "Jedis", owner: yoda
pizza_train = create_group name: "Pizza Only", owner: trevr

turing_1408.users += [trevr, trevr2, greg]
jedis.users       += [yolo_master, et, jorge]
pizza_train.users += [trevr2, yolo_master]
