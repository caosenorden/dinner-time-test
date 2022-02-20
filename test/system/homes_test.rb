require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase

  test "visiting home" do
    visit root_url

    assert_selector "h1", text: "It's dinner time !"
  end

end
