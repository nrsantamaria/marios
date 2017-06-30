class Product < ActiveRecord::Base
  has_many :reviews, dependent: :delete_all
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country, :presence => true
  validates :description, :presence => true
  before_save :upcase_first_letter

  scope :mostReviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
  scope :mostRecent, -> {(
    order(created_at: :desc).limit(3)
    )}
  scope :localProducts, -> { where(country: 'United States')}

  define_method(:upcase_first_letter) do
    self.name =  self.name.slice(0,1).capitalize + self.name.slice(1..-1)
  end
end
