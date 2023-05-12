require_relative "item.rb"
require_relative "list.rb"
require "byebug"

class TodoBoard
    def initialize(label)
        @label = List.new(label)
    end

    def get_command(str)
        print "/nEnter a command: "
        cmd, *args = gets.chomp.split(" ")

        case cmd
        when "mktodo"
            @list.add_item(*args)
            true
        when "up"
            List.up(index,amt)
            true
        when "down"
            List.down(index,amt)
            true
        when "swap"
            List.swap(idx1,idx2)
            true
        when "sort"
            List.sort_by_date!
            true
        when "priority"
            List.print_priority
            true
        when "print"
            List.print || List.print(idx)
            true
        when "quit"
            return false
        end
    end

    def run
        # get_command
    end
end