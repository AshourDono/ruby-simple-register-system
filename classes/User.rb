require("./classes/Person.rb")

class User < Person
    attr_accessor :email, :mobile
    # constructor
    def initialize(name="ahmed", email="ahmed@ahmed.com", mobile=01012751024)
        super(name)
        @email = email
        @mobile = mobile
    end
    
    # class methods
    def self.valid_mobile(mobile)
        mobile.match?(/^01[0125]\d{8}$/)
    end
    
    def self.list
        print "Please enter how many users you wanna display?: "
        user_number = gets.chomp
        # select all users
        if user_number == "*" then
            file_data = File.read("user.txt").split
            for line in file_data do
                details = line.split(":")
                puts "(" + details[1] + " | "+ details[2] + ")"
            end  
        # select first n number of users
        elsif user_number.to_i.to_s != "0"  then
            file_data = File.read("user.txt").split
            lines_array = file_data[0,user_number.to_i]
            for line in lines_array do
                details = line.split(":")
                puts "(" + details[1] + " | "+ details[2] + ")"
            end 
        end    
    end    

    # instance methods
    def create
        print "Name: "
        name = gets.chomp
        print "Email: "
        email = gets.chomp
        print "Mobile: "
        mobile = gets.chomp

        if !valid_name(name) then
            print "please enter a valid name"
        elsif !User.valid_mobile(mobile) then
            print "Please enter a valid mobile phone"
        else
            user = User.new
            user.name = name
            user.email = email
            user.mobile = mobile

            # record user data in file
            File.open("user.txt", "a") {|line| line.write "#{user.name}:#{user.email}:#{user.mobile}\n"}
            puts "Welcome #{user.name}"
        end    
    end    
end

def options
    print "\nEnter a choice: 
        1-  create a user
        2-  list users
        3-  exit
        \n
    "
end 

def show_menu
    while true do
        options
        question_number = gets.chomp.to_i
        case question_number
            when 1
                user = User.new
                print user.create
            when 2
                User.list
            when 3
                exit
            else
                print "Please enter a valid question number"  
            end                      
    end    
end

show_menu

