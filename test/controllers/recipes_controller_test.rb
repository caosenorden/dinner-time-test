require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest

  test "should search for recipes" do
    post "/recipes/search?ingredients%5B%5D=potato", xhr: true

    assert_response :success
  end

  test "error if no ingredients provided" do
    post "/recipes/search", xhr: true

    assert_response :unprocessable_entity
  end
end
