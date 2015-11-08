# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PrizePool.where(name: "Hourly", payout_frequency: 3600).first_or_create
PrizePool.where(name: "Daily", payout_frequency: 3600*24).first_or_create
PrizePool.where(name: "Weekly", payout_frequency: 3600*24*7).first_or_create
PrizePool.where(name: "Bi-weekly", payout_frequency: 3600*24*7*2).first_or_create

Charity.where(name: "Whirled Peas").first_or_create
Charity.where(name: "Blue Circle").first_or_create
Charity.where(name: "Shave the Whales").first_or_create
Charity.where(name: "Trump for President").first_or_create
