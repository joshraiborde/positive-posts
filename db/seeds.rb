
  bob = User.create(firstname: "Bob", lastname: "Bobby", email: "bob@bob.com", password: "123456")
  joan = User.create(firstname: "Joan", lastname: "Joany", email: "joan@joan.com", password: "123456")

  PositivePost.create(title: "Monday", text: "It is Monday!", author: "Bob", user_id: bob.id)

  bob.positive_posts.create(title: "Gym", text: "Getting gains at the gym!")

  joans_post = joan.positive_posts.build(title: "Taco Tuesday", text: "I've been waiting for Taco Tuesday!")
  joans_post.save