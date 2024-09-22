puts "Cleaning database..."
EventPlace.destroy_all  # Clean the EventPlace table
Category.destroy_all     # Clean the Category table if needed

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

puts "Finished!"
