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
        # binding.pry
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
        # binding.pry
        @products.find_all {|p| p.category == :paper}

    end

end