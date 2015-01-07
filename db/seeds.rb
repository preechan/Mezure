# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Channel.delete_all
Channel.create! id:1, name: "Mailchimp"

Metric.delete_all
Metric.create! id: 1, name: "Opens",channel_id: 1
Metric.create! id: 2, name: "Unique Opens",channel_id: 1
Metric.create! id: 3, name: "Clicks",channel_id: 1
Metric.create! id: 4, name: "Unique Clicks",channel_id: 1
Metric.create! id: 5, name: "Hard Bounces",channel_id: 1
Metric.create! id: 6, name: "Soft Bounces",channel_id: 1
Metric.create! id: 7, name: "Abuse Reports",channel_id: 1
Metric.create! id: 8, name: "Last Open",channel_id: 1
Metric.create! id: 9, name: "Last Click",channel_id: 1