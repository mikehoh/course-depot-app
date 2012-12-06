require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "validates presents of attrs" do
	product = Product.new
	assert product.invalid?
	assert product.errors[:title].any?
	assert product.errors[:description].any?
	assert product.errors[:imageurl].any?
	assert product.errors[:price].any?
  end
  test "validates price" do
	product = Product.new(:title=>"MyTitle",:description=>"MyDescription",:imageurl=>"myimage.png")
	assert product.invalid?
	product.price = 0
	assert product.errors[:price].any?
	product.price = -1
	assert product.errors[:price].any?
	product.price = 1.15
	assert product.errors[:price].any?
  end
  test "validates uniq" do
    product = Product.new(:title=>"MyTitle",:description=>"MyDescription",:imageurl=>"myimage.png",:price=>"9.99")
	product.title = products(:alice).title
	assert !products.save
  end
end
