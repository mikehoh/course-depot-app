class Cart < ActiveRecord::Base
	has_many :line_items, :depended=>:destroy
end