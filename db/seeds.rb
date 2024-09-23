puts "Cleaning database..."
Favorite.destroy_all
EventPlace.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating categories..."
categories = [
  { name: "Concert Venue" },
  { name: "Conference Center" },
  { name: "Theater" },
  { name: "Exhibition Hall" },
  { name: "Outdoor Venue" }
]

categories.each do |attributes|
  category = Category.create!(attributes)
  puts "Created #{category.name} category"
end

puts "Creating users..."
users = [
  { username: "admin_user", email: "admin@example.com", password: "password", role: "Host", is_admin: true },
  { username: "regular_user", email: "user@example.com", password: "password", role: "Host", is_admin: false }
]

users.each do |attributes|
  user = User.create!(attributes)
  puts "Created user #{user.username}"
end

puts "Creating event places..."
event_places = [
  { name: "Grand Concert Hall", description: "A beautiful venue for concerts.", location: "Downtown", category_id: Category.find_by(name: "Concert Venue").id, user: User.find_by(username: "admin_user") },
  { name: "Modern Conference Center", description: "Ideal for corporate events.", location: "Business District", category_id: Category.find_by(name: "Conference Center").id, user: User.find_by(username: "regular_user") },
  { name: "Classic Theater", description: "Perfect for plays and performances.", location: "City Center", category_id: Category.find_by(name: "Theater").id, user: User.find_by(username: "admin_user") }
]

event_places.each do |attributes|
  event_place = EventPlace.create!(attributes)
  puts "Created event place #{event_place.name}"
end

puts "Creating favorites..."
favorites = [
  { user: User.find_by(username: "regular_user"), event_place: EventPlace.find_by(name: "Grand Concert Hall") },
  { user: User.find_by(username: "regular_user"), event_place: EventPlace.find_by(name: "Modern Conference Center") }
]

favorites.each do |attributes|
  favorite = Favorite.create!(attributes)
  puts "Created favorite for #{favorite.user.username} - #{favorite.event_place.name}"
end

puts "Finished!"
