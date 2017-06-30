require 'rails_helper'

describe Product do
  it { should have_many :reviews}
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country }
  it { should validate_presence_of :description }
  it { is_expected.to callback(:upcase_first_letter).before(:save)}
end
