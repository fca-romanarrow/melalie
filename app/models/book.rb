class Book < ApplicationRecord
    def customers(num)
        if $que.length < $maxQueueChair
            if $que.empty?
                $que<<num
                # If the teller is asleep, the customer wakes up the teller.
                teller($serveTime)
            else
                # If the teller is busy, but chairs are available, then the customer sits in one of the free chairs.
                $que<<num
            end
    
            puts "Customer number #{num}"
        else
            # If a customer enters the bank and all chairs are occupied, then the customer leaves
            puts "- Customer #{num} leave"
        end
        sleep $customerTime
    end
    
    def teller(s)
        Thread.new do
            until $que.empty? do
                sleep s
                value = $que.shift
                puts "Bank teller serve customer #{value}"
            end
        end
    end

    def data()
        return [1,2,3,4,5]
    end
end
