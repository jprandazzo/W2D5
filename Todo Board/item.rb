class Item
    attr_accessor :title, :description
    attr_reader :deadline

    def self.valid_date?(date_str)
        return false if 
            (date_str[0..3].to_i < 1000 ||
            date_str[0..3].to_i > 9999 ||
            date_str[4] != "-" ||
            date_str[5..6].to_i <1
            date_str[5..6].to_i >12 ||
            date_str[7] != "-" ||
            date_str[8..9].to_i < 1 ||
            date_str[8..9].to_i > 31)
        true
    end

    def initialize(title,deadline,description)
        p "Error! please enter deadline in correct format 'YYYY-MM-DD'" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline if Item.valid_date?(deadline)
        @description = description
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline 
        else
            p "Error! please enter deadline in correct format 'YYYY-MM-DD'"
        end
    end
end