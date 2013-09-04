# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  content       :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#  restaurant_id :integer
#

class Order < ActiveRecord::Base

	belongs_to :user
	has_one :restaurant

	default_scope :order => 'orders.created_at DESC'

end
