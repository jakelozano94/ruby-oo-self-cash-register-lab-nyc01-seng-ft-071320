require 'pry'
class CashRegister
    attr_accessor :total
    def initialize(discount = 0)
        @total = 0.0
        @discount = discount.to_f
        @all_items = []
        @last_transaction = []
        @receipt = []
    end
    def discount
        @discount
    end
    def add_item(item, price, quantity = 1)
        @last_transaction.concat([item]*quantity)
        @receipt << price
        item_total = price*quantity
        @total += item_total
        @all_items.concat([item]*quantity)
    end
    def apply_discount
        if @discount == 0
            p "There is no discount to apply."
        else
        final_total = @total*(1-@discount/100)
        @total = final_total.to_i
        p "After the discount, the total comes to $#{@total}."
        end
    end
    def items
       request = @all_items.flatten
       request
    end
    def void_last_transaction
        @all_items = @all_items.pop
        @receipt.pop
        new_total = @receipt.sum
        @total = new_total
    end

#binding.pry
end

