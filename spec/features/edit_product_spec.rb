require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    product = Product.create({:name => 'Cheese', :id => '1'})
    visit product_path(product.id)
    click_on 'Edit'
    fill_in 'product_name', :with => 'Fancy Cheese'
    click_on 'Update Product'
    expect(page).to have_content 'Fancy Cheese'
  end
end
