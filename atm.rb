class Atm
    def amount(price)
        @y=price
        money={
            25=>"Quaters",
            10=>"Dimes",
            5=>"Nickels",
            1=>"Penny"
        }
        for item in money.keys
            if @y.to_i >= item.to_i
                no= @y.to_i / item.to_i
                @y = @y.to_i % item.to_i
                print "No of #{money[item]} required is #{no} "
            end
        end
    end
end
x=Atm.new
print "Enter the amount to withdraw "
k=gets.chomp
x.amount(k) 