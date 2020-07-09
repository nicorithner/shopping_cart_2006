class ShoppingCart
    attr_reader :name, :capacity, :products
    def initialize(name, capacity)
        @name = name
        @capacity = capacity[0..1].to_i
        @products = []
    end
    
    def add_product(product)
        products << product
    end

    def details
      cart_details = {name: @name, capacity: @capacity}
    end

    def total_number_of_products
        @products.sum { |product| product.quantity}
    end

    def is_full?
        if total_number_of_products >= @capacity
            true
        else 
            false
        end
    end

    def products_by_category(category)
        @products.find_all {|p| p.category == category}
    end

    def percentage_occupied
        ((total_number_of_products.to_f / @capacity) * 100).round(2)
    end

    def sorted_products_by_quantity
        @products.sort_by do |product|
            product.quantity
        end
    end

    def product_breakdown
        output = {}
            @products.each do |product|
                output[product.category] = product
            end 
        output.sort.to_h
    end
end