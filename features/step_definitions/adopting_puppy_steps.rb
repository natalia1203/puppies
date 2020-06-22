
Given('I am on the puppy adoption site') do
  visit(HomePage)
end

When('I click the View Details button for {string}') do |name|
  on(HomePage).select_puppy name
end

And('I click the Complete the Adoption button') do
  on(ShoppingCartPage).proceed_to_checkout
end

And('I click the Adopt Me button') do
  on(DetailsPage).add_to_cart
end

Then('I complete the adoption') do
  on(CheckoutPage).checkout
end

Then('I should see {string}') do |string|
  expect(@current_page.text).to include string
end

When('I click the Adopt Another Puppy button') do
  on(ShoppingCartPage).continue_shopping
end

Then('I should see {string} as the name for line item {int}') do |name, line_item|
  row = (line_item.to_i - 1) * 6
  expect(@browser.table(index: 0)[row][1].text).to include name
end

Then('I should see {string} as the cart total') do |total|
  expect(on(ShoppingCartPage).cart_total).to eql total
end

When('I checkout leaving the name field blank') do
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckoutPage).checkout('name' => '')
end

Then('I should see the error message {string}') do |msg|
  expect(on(CheckoutPage).error_messages).to include msg
end