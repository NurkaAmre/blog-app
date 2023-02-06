# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  
authors = User.create([
  {name: 'Naruto', photo:'https://cdn.myanimelist.net/images/characters/10/386018.jpg?_gl=1*cc25db*_ga*NTg1NzA0MjU1LjE2NzUzMTQ4MTE.*_ga_26FEP9527K*MTY3NTY2MzU4OS4yLjAuMTY3NTY2MzU4OS42MC4wLjA.', bio: 'Naruto Uzumaki is a fictional character and the protagonist of the Naruto manga and anime series created by Masashi Kishimoto. Naruto is a young ninja from the village of Konohagakure (Hidden Leaf Village) who aspires to become the Hokage, the leader of his village. Despite facing many challenges, Narutos determination, courage, and love for his friends have earned him the respect and admiration of his fellow ninja and villagers. Throughout the series, Naruto develops his skills, forms close bonds with his comrades, and learns the truth about his own heritage and the Nine-tailed Fox demon that attacked his village when he was a child'},
  {name: 'Sasuke', photo: 'https://cdn.myanimelist.net/images/characters/8/484628.jpg', bio: 'Sasuke Uchiha is a fictional character and one of the main characters in the Naruto manga and anime series created by Masashi Kishimoto. Sasuke is a member of the Uchiha clan, a prestigious family of ninjas known for their Sharingan, a powerful bloodline ability that allows them to copy and enhance the skills of others. Sasukes life changes dramatically after his entire family is murdered by his own older brother, Itachi. Determined to take revenge on Itachi, Sasuke leaves the Hidden Leaf Village and trains under Orochimaru, one of the legendary Sannin, to become stronger.'},
  {name: 'Hinata', photo: 'https://cdn.myanimelist.net/images/characters/15/225985.jpg?_gl=1*zedcvx*_ga*NTg1NzA0MjU1LjE2NzUzMTQ4MTE.*_ga_26FEP9527K*MTY3NTY2NTYyMi4zLjEuMTY3NTY2NTkwNC4yMy4wLjA.', bio: 'Hinata Hyuga is a fictional character in the Naruto manga and anime series created by Masashi Kishimoto. Hinata is a member of the Hyuga clan, a prestigious family of ninjas known for their Byakugan, a powerful bloodline ability that allows them to see through solid objects and see great distances. Hinata is initially portrayed as a shy and timid person, but she eventually grows into a confident and capable ninja. Throughout the series, Hinata develops a strong admiration for Naruto, the main character, and eventually falls in love with him.'},
  {name: 'Kakachi', photo: 'https://cdn.myanimelist.net/images/characters/4/307805.jpg?_gl=1*l6ptw2*_ga*NTg1NzA0MjU1LjE2NzUzMTQ4MTE.*_ga_26FEP9527K*MTY3NTY2NTYyMi4zLjEuMTY3NTY2NTY1Ny4yNS4wLjA.', bio: 'Kakashi is a skilled and experienced ninja, having participated in many battles and missions. He is also a talented teacher, having trained and mentored several generations of ninja, including Team 7. Despite his cool and reserved demeanor, Kakashi is a kind and caring person who places the safety and well-being of his friends and students above all else. He is widely regarded as one of the strongest and most capable characters in the Naruto universe, and his actions and decisions often have a significant impact on the events of the series.'},
  {name: 'Sakura', photo: 'https://cdn.myanimelist.net/images/characters/15/103640.jpg', bio: 'Sakura has a strong will and a no-nonsense attitude, and she is often the voice of reason and levelheadedness among her friends. She is also fiercely loyal to those she cares about and is willing to go to great lengths to protect them. Despite her tough exterior, Sakura also has a softer side, and she forms close bonds with her teammates and other characters throughout the series. She is widely regarded as a beloved and important character in the Naruto universe, and her development and growth are central to the story.'}
  ])

posts = Post.create([
  {author_id: 35, title: 'Shadow clone jutsu', text: ' A technique that allows Naruto to create multiple copies of himself. The clones have their own consciousness and can perform various tasks.'},
  {author_id: 35, title: 'Nine-Tailed Fox Chakra Mode', text: 'A powerful transformation that Naruto can access when he draws on the chakra of the Nine-Tailed Fox that was sealed inside him. In this mode, Naruto\'s power and speed are greatly increased.'},
  {author_id: 36, title: 'Chidori', text: 'A powerful ninjutsu technique that Sasuke learned from Kakashi Hatake. Chidori involves gathering lightning-based chakra in the user\'s hand, creating a piercing and lethal weapon.'},
  {author_id: 37, title: 'Byakugan', text: 'A powerful dojutsu unique to the Hyuga clan. The Byakugan grants Hinata near 360-degree vision, allowing her to see through solid objects and predict the movements of her opponents.'},
  {author_id: 39, title: 'Strength of a Hundred Seal', text: 'A powerful medical ninjutsu technique that Sakura learns from Tsunade, the Fifth Hokage. The Strength of a Hundred Seal temporarily enhances Sakura\'s physical abilities, making her much stronger and faster.'},
  {author_id: 38, title: 'Sharingan', text: 'An advanced dojutsu that Kakashi possesses. The Sharingan allows him to copy other ninja\'s techniques, as well as provide enhanced perception and reaction time.'},
  {author_id: 36, title: 'Falcon Punch', text: 'A powerful taijutsu technique that Sasuke learns from Orochimaru. The technique involves launching a powerful punch with enough force to knock the target away.'},
  {author_id: 37, title: 'Protective Eight Trigrams Sixty-Four Palms', text: 'A defensive version of the Eight Trigrams Sixty-Four Palms technique. Hinata uses this technique to protect herself and her allies from harm.'}
])

comments = Comment.create([
  {author_id: 1, post_id: 1, text: 'My Hobby Is Eating Different Kinds Of Ramen And Comparing Them.'},
  {author_id: 4, post_id: 2, text: 'Sorry I\'m Late Guys, I Got Lost On The Path Of Life.'},
  {author_id: 5, post_id: 3, text: 'Run Into The Setting Sun. Run And Suffer. But Don\'t Mess Up Your Hair!'},
  {author_id: 2, post_id: 5, text: 'What Adult Goes Full Force While Fighting Mere Children?'},
  {author_id: 3, post_id: 4, text: 'I Am Not A Pervert, I Am A Super Pervert!'}
])

likes = Like.create([
  {author_id: 2, post_id: 1},
  {author_id: 3, post_id: 1},
  {author_id: 1, post_id: 4},
  {author_id: 5, post_id: 1},
  {author_id: 4, post_id: 3}
])