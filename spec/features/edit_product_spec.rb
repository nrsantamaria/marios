require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    product1 = Product.create(:name => 'Cheese', :cost => '50', :description => 'cheesy', :country => 'France')
    product2 = Product.create(:name => 'Bread', :cost => '50', :description => 'bready', :country => 'France')
    product3 = Product.create(:name => 'Wine', :cost => '50', :description => 'boozy', :country => 'France')
    product4 = Product.create(:name => 'Mushrooms', :cost => '50', :description => 'earthy', :country => 'France')
    visit products_path
    click_link 'Cheese'
    click_on 'Edit this Product'
    fill_in 'product[name]', :with => 'Fancy Cheese'
    click_on 'Update Product'
    expect(page).to have_content 'Fancy Cheese'
  end
end
