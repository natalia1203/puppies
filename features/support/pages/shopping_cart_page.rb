class ShoppingCartPage
  include PageObject

  NAME_COLUMN = 1

  button(:proceed_to_checkout, value: "Complete the Adoption")
  button(:continue_shopping, value: "Adopt Another Puppy")
  table(:cart, index: 0)
  cell(:cart_total, class: "total_cell")

  def name_for_line_item(line_item)
    cart_line_item(line_item)[NAME_COLUMN].text
  end

  private

  def cart_line_item(line_item)
    @browser.table(index: 0)[row_for(line_item)]
  end
end