require 'faker'
require "open-uri"

Booking.destroy_all
GistSession.destroy_all
User.destroy_all

######## Create user1 (Christian Zamora), create a gist_session ########

user1 = User.new(email: 'chris@gmail.com', username: 'Christian', password: '123456', password_confirmation: '123456')
file = URI.open('https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=635&q=80')
user1.photo.attach(io: file, filename: 'user1.jpeg', content_type: 'image/jpeg')
p user1.save!
session1 = GistSession.new(
  gist: 'Nutrition',
  title: "Best meals for better health",
  description: 'Talks about how to eat healthy for young people',
  address: 'Coyoacan, Mexico City',
  start_time: Time.new(2021, 1, 1, 8, 0, 0),
  finish_time: Time.new(2021, 1, 1, 9, 0, 0),
  capacity: 15,
  host_id: user1.id
)
file = URI.open('https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80')
session1.photo.attach(io: file, filename: 'box.jpeg', content_type: 'image/jpeg')
p session1.save!

######## Create user2 (Agathe Laburthe-Tolra), create a gist_session, book a boxing session ########

user2 = User.new(email: 'agathe@gmail.com', username: 'Agathe', password: '123456', password_confirmation: '123456')
file = URI.open('https://images.unsplash.com/photo-1558898479-33c0057a5d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80')
user2.photo.attach(io: file, filename: 'user2.jpeg', content_type: 'image/jpeg')
p user2.save!
session2 = GistSession.new(
  gist: 'football',
  title: "Advanced Football",
  description: 'Perfect your football analysis to help enjoy the game better',
  address: 'Polanco, Mexico City',
  start_time: Time.new(2021, 1, 1, 9, 0, 0),
  finish_time: Time.new(2021, 1, 1, 10, 30, 0),
  capacity: 10,
  host_id: user2.id
)
file = URI.open('https://images.unsplash.com/flagged/photo-1571771710019-ca58cf80f225?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
session2.photo.attach(io: file, filename: 'football.jpeg', content_type: 'image/jpeg')
p session2.save!
p Booking.create!(
  booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
  guest_id: user2.id,
  gist_session_id: user1.gist_sessions.first.id
)

######## Create user2 (Corentin Julienne), create a gist_session, book a boxing session ########

user3 = User.new(email: 'corentin@gmail.com', username: 'Corentin', password: '123456', password_confirmation: '123456')
file = URI.open('https://images.unsplash.com/photo-1544724107-6d5c4caaff30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1347&q=80')
user3.photo.attach(io: file, filename: 'user3.jpeg', content_type: 'image/jpeg')
p user3.save!
session3 = GistSession.new(
  gist: 'Baking',
  title: 'Best Techniques for Baking',
  description: 'Share Ideas with other bakers about baking techniques that you find efficient',
  address: 'Alakia, Ibadan',
  start_time: Time.new(2021, 1, 1, 20, 0, 0),
  finish_time: Time.new(2021, 1, 1, 22, 0, 0),
  capacity: 5,
  host_id: user3.id
)
file = URI.open('https://images.unsplash.com/photo-1499889808931-317a0255c0e9?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80')
session3.photo.attach(io: file, filename: 'chess.jpeg', content_type: 'image/jpeg')
p session3.save!
p Booking.create!(
  booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
  guest: user3,
  gist_session_id: user1.gist_sessions.first.id
)

######## Create user4 (Oscar Duque), create a gist_session, book a boxing session ########

user4 = User.create!(email: 'oscar@gmail.com', username: 'Oscar', password: '123456', password_confirmation: '123456')
file = URI.open('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80')
user4.photo.attach(io: file, filename: 'user4.jpeg', content_type: 'image/jpeg')
p user4.save!
session4 = GistSession.new(
  gist: 'yoga',
  title: 'Steam Yoga',
  description: 'Smash stress, build strength, get results and feel amazing',
  address: 'Anta Fe, Mexico City',
  start_time: Time.new(2021, 1, 1, 7, 0, 0),
  finish_time: Time.new(2021, 1, 1, 8, 0, 0),
  capacity: 5,
  host: user4
)
file = URI.open('https://images.unsplash.com/photo-1532798442725-41036acc7489?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1334&q=80')
session4.photo.attach(io: file, filename: 'yoga.jpeg', content_type: 'image/jpeg')
p session4.save!
p Booking.create!(
  booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
  guest_id: user4.id,
  gist_session_id: user1.gist_sessions.first.id
)

# session 2 Oscar

session5 = GistSession.new(
  gist: 'krav maga',
  title: 'Krav Maga',
  description: 'Learn to protect yourself with the most efficient self defense system',
  address: 'Coyoacan, Mexico City',
  start_time: Time.new(2021, 1, 3, 7, 0, 0),
  finish_time: Time.new(2021, 1, 3, 8, 0, 0),
  capacity: 10,
  host: user4
)
file = URI.open('https://images.unsplash.com/photo-1577998555981-6e798325914e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1486&q=80')
session5.photo.attach(io: file, filename: 'kravmaga.jpeg', content_type: 'image/jpeg')
p session5.save!

# session 3 Oscar

session6 = GistSession.new(
  gist: 'Bible Studies',
  title: 'Word of God',
  description: 'share the words of God and encouragement to the new generation !',
  address: 'The White House, Washington D.C.',
  start_time: Time.new(2021, 2, 1, 7, 0, 0),
  finish_time: Time.new(2021, 2, 1, 8, 0, 0),
  capacity: 3,
  host: user4
)
file = URI.open('https://images.unsplash.com/photo-1529070538774-1843cb3265df?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1950&q=80')
session6.photo.attach(io: file, filename: 'brethren.jpeg', content_type: 'image/jpeg')
p session6.save!

# session 4 Oscar

session7 = GistSession.new(
  gist: 'Chyking',
  title: 'Get dem girls',
  description: 'Discuss tips and new ideas for getting laid',
  address: 'Tepito, CDMX',
  start_time: Time.new(2020, 12, 1, 7, 0, 0),
  finish_time: Time.new(2020, 12, 1, 8, 0, 0),
  capacity: 15,
  host: user4
)
file = URI.open('https://images.unsplash.com/photo-1490578474895-699cd4e2cf59?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1351&q=80')
session7.photo.attach(io: file, filename: 'chyking.jpeg', content_type: 'image/jpeg')
p session7.save!

# session 5 Oscar

session8 = GistSession.new(
  gist: 'fencing',
  title: 'Fencing',
  description: 'The thrill of sword duels, without the risks of bleeding out..',
  address: '11th District, Paris',
  start_time: Time.new(2021, 2, 1, 5, 0, 0),
  finish_time: Time.new(2021, 2, 1, 7, 0, 0),
  capacity: 12,
  host: user4
)
file = URI.open('https://images.unsplash.com/photo-1529751480052-2f3f1839834e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
session8.photo.attach(io: file, filename: 'fencing.jpeg', content_type: 'image/jpeg')
p session8.save!

# session 6 Oscar

session9 = GistSession.new(
  gist: 'Politics',
  title: 'Political state of the nation',
  description: 'Discussion about the political state of the nation and the world generally',
  address: 'Santa Fe, Mexico City',
  start_time: Time.new(2021, 1, 13, 7, 0, 0),
  finish_time: Time.new(2021, 1, 13, 9, 0, 0),
  capacity: 13,
  host: user4
)
file = URI.open('https://images.unsplash.com/photo-1541872703-74c5e44368f9?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1295&q=80')
session9.photo.attach(io: file, filename: 'politics.jpeg', content_type: 'image/jpeg')
p session9.save!

# session 7 Oscar

session10 = GistSession.new(
  gist: 'culture',
  title: 'Culture is golden',
  description: 'Discussion about culture for deep rooted people and people who wants to learn more',
  address: 'Ile ife, Nigeria',
  start_time: Time.new(2021, 3, 1, 7, 0, 0),
  finish_time: Time.new(2021, 3, 1, 9, 0, 0),
  capacity: 10,
  host: user4
)
file = URI.open('https://images.unsplash.com/photo-1540247110674-31e928ee852a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=675&q=80')
session10.photo.attach(io: file, filename: 'culture.jpeg', content_type: 'image/jpeg')
p session10.save!

# session 8 Oscar

session11 = GistSession.new(
  gist: 'basketball',
  title: 'basketball',
  description: 'Relax and stay fit practicing basketball in CDMX',
  address: 'Condesa, Mexico City',
  start_time: Time.new(2020, 12, 1, 7, 0, 0),
  finish_time: Time.new(2020, 12, 1, 8, 0, 0),
  capacity: 12,
  host: user4
)
file = URI.open('https://images.unsplash.com/photo-1519861531473-9200262188bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
session11.photo.attach(io: file, filename: 'basketball.jpeg', content_type: 'image/jpeg')
p session11.save!

# session 9 Oscar

session12 = GistSession.new(
  gist: 'crossfit',
  title: 'crossfit',
  description: 'Not for newbies. Prepare to suffer !',
  address: 'Chapultepec, Mexico City',
  start_time: Time.new(2021, 4, 1, 7, 0, 0),
  finish_time: Time.new(2021, 4, 1, 8, 0, 0),
  capacity: 30,
  host: user4
)
file = URI.open('https://images.unsplash.com/photo-1526401485004-46910ecc8e51?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
session12.photo.attach(io: file, filename: 'crossfit.jpeg', content_type: 'image/jpeg')
p session12.save!


######## For every existing gist_session creates a user and book a session ########

GistSession.all.each do |gist_session|
  p user5 = User.create!(email: Faker::Internet.email, username: Faker::Name.first_name, password: '123456', password_confirmation: '123456')
  p new_booking = Booking.create!(
    booking_date: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
    guest_id: user5.id,
    gist_session_id: gist_session.id
  )
end

=begin
p new_review = Review.create!(
    rating: rand(3..5),
    commentary: Faker::Restaurant.review,
    booking_id: new_booking.id
  )
=end
