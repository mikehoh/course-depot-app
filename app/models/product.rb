class Product < ActiveRecord::Base
	default_scope :order=>'price'
#	scope :cheap, lambda{where(:price<10)}
	scope :cheap, where('price<100')

	validates :title, :description, :imageurl, :price, :presence=>true
	validates :title, :uniqueness=>true
	validates :price, :numericality=>{:greater_than_or_equal_to=>0.01}
	validates :imageurl, :format=>{:with=>%r{\.(gif|jpg|png)$}i,:message=>"Must be JPG, PNG or GIF"}
end
