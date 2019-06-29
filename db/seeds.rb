coffee_dad_url = 'https://twitter.com/coffee_dad?lang=en'
default_photo = 'https://pngimage.net/wp-content/uploads/2018/05/default-profile-pic-png-8.png'
User.create(username:'jacob', password: '1', phone: '313-1337', email: 'real@email.com', avatar: default_photo, twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'bren', password: '1', phone: '313-1337', email: 'real@email.com', avatar: default_photo, twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'tim', password: '1', phone: '313-1337', email: 'real@email.com', avatar: default_photo, twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'pat', password: '1', phone: '313-1337', email: 'real@email.com', avatar: default_photo, twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'jason', password: '1', phone: '313-1337', email: 'real@email.com', avatar: default_photo, twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'diana', password: '1', phone: '313-1337', email: 'real@email.com', avatar: default_photo, twitter: coffee_dad_url, facebook: coffee_dad_url)

Contact.create(user_id: 1 , contactee_id: 2 ,meet_cycle: 7, call_cycle: 1 )
Contact.create(user_id: 1 , contactee_id: 3 ,meet_cycle: 30, call_cycle: 3 )
Contact.create(user_id: 1 , contactee_id: 4 ,meet_cycle: 7, call_cycle: 5 )
Contact.create(user_id: 1 , contactee_id: 5 ,meet_cycle: 12, call_cycle: 7 )
Contact.create(user_id: 1 , contactee_id: 6 ,meet_cycle: 60, call_cycle: 12 )
Contact.create(user_id: 2 , contactee_id: 1 ,meet_cycle: 42, call_cycle: 12 )
Contact.create(user_id: 2 , contactee_id: 3 ,meet_cycle: 32, call_cycle: 54 )
Contact.create(user_id: 2 , contactee_id: 4 ,meet_cycle: 42, call_cycle: 32 )

Event.create(name: 'FSP' ,location: '11 Broadway St',date: '2019-12-15', time: '18:15' ,description: "Flatiron School Presents" )
Event.create(name: 'Happy Hour' ,location: '11 Broadway St',date: '2019-7-15', time: '10:00' ,description: "Come meet other cohorts and play some games!!!" )
