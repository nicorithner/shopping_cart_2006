class ShoppingCart
    attr_reader :name, :capacity, :products
    def initialize(name, capacity)
        @name = name
        @capacity = capacity.to_i
        @products = []
    end
    
    def add_product(product)
        products << product
    end

    def details
      {name: @name, capacity: @capacity}
    end

    def total_number_of_products
        @products.sum { |product| product.quantity}
    end

    def is_full?
        total_number_of_products > @capacity
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
        end.reverse
    end

    def product_breakdown
        output = {}
            categories = @products.map do |product| 
                product.category
            end.uniq
            categories.each do |category|
                output[category] = products_by_category(category)
            end
        output
    end

end