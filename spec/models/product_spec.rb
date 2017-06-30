require 'rails_helper'

describe Product do
  it { should have_many :reviews}
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country }
  it { should validate_presence_of :description }
  describe '#upcase_first_letter' do
    product = Product.create({:name => 'cheese', :cost => "50", :country => "USA"})
    it { expect(product.name).to(eq("Cheese"))}
end
