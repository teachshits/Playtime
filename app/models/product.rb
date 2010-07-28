class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price
	
	validates_presence_of :title, :description, :image_url
	validates_length_of :title, :maximum => 10, :message => "has more than 10 simbols"
	validates_numericality_of :price
	validate :price_must_be_at_least_a_cent
	validates_uniqueness_of :title
	validates_format_of :image_url,
											:with => %r{\.(gif|jpg|png)$}i,
											:message => 'Must be finish at gif/png/jpg'

protected
	def price_must_be_at_least_a_cent
		errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
	end
end