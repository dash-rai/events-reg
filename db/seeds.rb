# add seed data here and run `rake db:seed`
Category.new(name: "Random").save
Event.new(name: "random", description: "this is a very very random event").save
Event.new(name: "coding competition", description: "Again, random stuff about how coding competitions go", category_id: Category.find_by(name: "Random").id).save
Event.new(name: "suit and tie", description: "All pressed up in black and white", category_id: 1).save
