puts "Welcome to App"
puts "Please enter your credentials"

print "wanna register?: "
answer = gets.chomp

if answer == "y" then
    load('./classes/User.rb')
else
    exit
end       