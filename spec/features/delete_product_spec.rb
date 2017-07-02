require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    product1 = Product.create(:name => 'Cheese', :cost => '50', :description => 'cheesy', :country => 'France')
    product2 = Product.create(:name => 'Bread', :cost => '50', :description => 'bready', :country => 'France')
    product3 = Product.create(:name => 'Wine', :cost => '50', :description => 'boozy', :country => 'France')
    product4 = Product.create(:name => 'Mushrooms', :cost => '50', :description => 'earthy', :country => 'France')
    visit products_path
    click_link 'Cheese'
    click_on 'Delete this Product'
    expect(page).to have_content 'Products'
  end
end
