require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Add a New Product'
    fill_in 'product[name]', :with => 'Food'
    fill_in 'product[cost]', :with => '50'
    select 'France', :from => 'product[country]'
    fill_in 'product[description]', :with => 'So good. So wow.'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
