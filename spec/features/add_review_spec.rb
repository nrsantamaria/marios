require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    product1 = Product.create(:name => 'Cheese', :cost => '50', :description => 'cheesy', :country => 'France')
    product2 = Product.create(:name => 'Bread', :cost => '50', :description => 'bready', :country => 'France')
    product3 = Product.create(:name => 'Wine', :cost => '50', :description => 'boozy', :country => 'France')
    product4 = Product.create(:name => 'Mushrooms', :cost => '50', :description => 'earthy', :country => 'France')
    visit products_path
    click_link 'Cheese'
    click_link 'Add a Review'
    fill_in 'review[author]', :with => 'Hermione'
    fill_in 'review[content_body]', :with => 'Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!Delish!'
    fill_in 'review[rating]', :with => '5'
    click_on 'Create Review'
    expect(page).to have_content 'Reviews'
  end

  it "gives error when no author is entered" do
    product1 = Product.create(:name => 'Cheese', :cost => '50', :description => 'cheesy', :country => 'France')
    product2 = Product.create(:name => 'Bread', :cost => '50', :description => 'bready', :country => 'France')
    product3 = Product.create(:name => 'Wine', :cost => '50', :description => 'boozy', :country => 'France')
    product4 = Product.create(:name => 'Mushrooms', :cost => '50', :description => 'earthy', :country => 'France')
    visit products_path
    click_link 'Cheese'
    click_link 'Add a Review'
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
end
