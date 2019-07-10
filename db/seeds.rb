coffee_dad_url = 'https://twitter.com/coffee_dad?lang=en'
# default_photo = 'https://pngimage.net/wp-content/uploads/2018/05/default-profile-pic-png-8.png'

def rando_sharky
  num = rand(1..20)
  shark_url = "https://sadanduseless.b-cdn.net/wp-content/uploads/2018/10/ikea-shark#{num}.jpg"
end

User.create(username:'jacob', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'bren', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'tim', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'pat', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'jason', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'diana', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'troy', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'ferris', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'dan', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'tommy', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'jeff', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'soyeong', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'will', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'rob', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'edgar', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'danielle', password: '1', phone: '313-1337', email: 'real@email.com', avatar: rando_sharky(), twitter: coffee_dad_url, facebook: coffee_dad_url)
User.create(username:'kevin', password: '1', phone: '313-1337', email: 'real@email.com', twitter: coffee_dad_url, facebook: coffee_dad_url)

Event.create(name: 'FSP' ,location: '11 Broadway St',date: '2019-12-15', time: '18:15' ,description: "Flatiron School Presents" )
Event.create(name: 'Happy Hour' ,location: '11 Broadway St',date: '2019-7-15', time: '10:00' ,description: "Come meet other cohorts and play some games!!!" )
