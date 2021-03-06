class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :picture, :category_id
	
	validates_presence_of :title, :description
	validates_length_of :title, :maximum => 10
	validates_numericality_of :price, :greater_than => 0.01
	#validate :price_must_be_at_least_a_cent
	validates_uniqueness_of :title
	
	has_attached_file :picture, :styles => { :small => "100x100>" }

	validates_attachment_presence :picture
	validates_attachment_size :picture, :less_than => 1.megabytes
	validates_attachment_content_type :picture, :content_type => ['image/gif', 'image/png', 'image/jpeg']

	def self.find_products_for_sale
		find(:all, :order => "title")
	end
	
	has_many :comments
	has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :category
  
  def to_jstree_products
    hash = {:data => title, :attr => {:category_id => category_id, :p_id => id, :rel => "product"}}
    hash
  end
  
protected
	def price_must_be_at_least_a_cent
		errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
	end
end
