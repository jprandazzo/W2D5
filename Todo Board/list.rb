require_relative "item.rb"
require "byebug"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        # if Item.valid_date?(deadline)
        #     @items << Item.new(title, deadline, description)
        #     true
        # else
        #     false
        # end
        @items << Item.new(title, deadline, description)
    end

    def size
        @items.length
    end

    def valid_index?(index)
        @items[index] != nil
    end

    def swap(i1,i2)
        return false if !(valid_index?(i1) && valid_index?(i2))
        @items[i1], @items[i2] = @items[i2], @items[i1]
        true
    end

    def [](index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts label
        puts "Index | Item           | Deadline"
        @items.each_with_index {|item, idx| puts idx.to_s + "     |" + item.title + "|            " + item.deadline}
    end

    def print_full_item(index)
        puts "------------------"
        puts @items[index].title + "          " + @items[index].deadline
        puts @items[index].description
        puts "------------------"
    end

    def print_priority
        print_full_item(0)
    end

    def up(index,amount=1)
        return false if !valid_index?(index)
        item = @items[index]
        amount.times do
            idx = @items.index(item)
            # debugger
            if item != @items[0]
                @items[idx-1],@items[idx] = @items[idx],@items[idx-1]
            end
        end
        true
    end

    def down(index,amount=1)
        return false if !valid_index?(index)
        item = @items[index]
        amount.times do
            idx = @items.index(item)
            if item != @items[-1]
                @items[idx],@items[idx+1] = @items[idx+1],@items[idx]
            end
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end
end

# my_list = List.new('Groceries')
# p my_list.size