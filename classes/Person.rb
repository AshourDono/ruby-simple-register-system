class Person
    attr_accessor :name

    # class methods
    def initialize(name)
        @name = name
    end

    # instance methods
    def valid_name(name)
        name.match?(/^[a-zA-Z][a-zA-Z\s]*$/)
    end    
    
end    