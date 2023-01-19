class CashRegister

    attr_accessor :discount, :all_items, :prices_array, :items, :transaction_counter
    attr_reader :total
    

    def initialize (discount=0)
        @discount = discount
        @total = 0
        @items = []
        @prices_array = []
    end
    
    def total=(total)
        @total = total
    end

    def add_item (item, price, quantity=1)
        @total = total + price * quantity
        quantity.times do 
            @items << item
            @prices_array << price
        end
        @transaction_counter = quantity
    end

   def apply_discount
    if @discount > 0
        
          @total = @total * ((100 - @discount)*0.01)
          puts @total
        "After the discount, the total comes to $#{@total.to_i}."
    else
        "There is no discount to apply."
    end
   end

    def void_last_transaction
       @transaction_counter.times do 
            @prices_array.pop
            @total = prices_array.length == 0 ? 0.0 : @prices_array.sum
       end
    end
end

cash1 = CashRegister.new(10)
 cash1.total = 0
  cash1.add_item('banana', 5, 2)
  cash1.add_item('banana', 5)
  cash1.add_item('banana', 5)

cash1.void_last_transaction
 