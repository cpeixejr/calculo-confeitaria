require "application_system_test_case"

class IngredientsTest < ApplicationSystemTestCase
  setup do
    @ingredient = Ingredient.ordered.first
  end

  test "visiting the index" do
    visit ingredients_url

    assert_selector "h1", text: "Ingredients"
  end

  test "Create a new ingredient" do
    new_ingredient_name = "Leite"
    visit ingredients_url
    click_on "New ingredient"
    assert_selector "h1", text: "Ingredients"
    fill_in "Name", with: new_ingredient_name
    fill_in "Price", with: 5.5
    click_on "Create ingredient"
    assert_selector "h1", text: "Ingredients"
    assert_text new_ingredient_name
  end

  test "Showing an ingredient" do
    visit ingredients_path
    click_link @ingredient.name

    assert_selector "h1", text: @ingredient.name
    assert_selector "h2", text: @ingredient.price
  end

  test "Updating an ingredient" do
    updated_ingredient_name = "Chocolate"
    visit ingredients_path
    assert_selector "h1", text: "Ingredients"

    click_on "Edit", match: :first
    fill_in "Name", with: updated_ingredient_name
    assert_selector "h1", text: "Ingredients"
    click_on "Update ingredient"

    assert_selector "h1", text: "Ingredients"
    assert_text updated_ingredient_name
  end

  test "Destroying an ingredient" do
    visit ingredients_path
    assert_text @ingredient.name

    click_on "Delete", match: :first
    assert_no_text @ingredient.name
  end
end
