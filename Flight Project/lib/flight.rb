class Flight
    attr_reader :passengers
    
    def initialize(str,num)
        @flight_number = str
        @capacity = num
        @passengers = []
    end

    def full?
        passengers.length >= @capacity
    end

    def board_passenger(pass)
        passengers << pass if (pass.has_flight?(@flight_number) && !full?)
    end

    def list_passengers
        arr = []
        passengers.each {|p| arr << p.name}
        arr
    end

    def [](num)
        passengers[num]
    end

    def <<(pass)
        board_passenger(pass)
    end
end
