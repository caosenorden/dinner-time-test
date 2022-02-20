module Recipes
  class FindByIngredients
    attr_accessor :ingredients, :options

    def self.execute(*args)
      new(*args).execute
    end

    def initialize(ingredients, options={})
      self.ingredients = ingredients.map{|i| "%#{i}%"}
      self.options = default_options.merge(options)
    end

    def execute
      Recipe
        .where("array_to_string(ingredients, ';') ILIKE #{inclusivity}(ARRAY[?])", ingredients)
        .order("#{order} DESC", "title ASC")
    end

    private

    def inclusivity
      options[:inclusivity].upcase
    end

    def order
      options[:order]
    end

    def default_options
      {
        inclusivity: "all",
        order: "ratings"
      }
    end

    #testing
    # query.map{|r| ["egg", "wine", "potato", "banana"].alls?{|t| r.ingredients.join("").match(/#{t}/)}}

  end
end