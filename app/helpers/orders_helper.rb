module OrdersHelper

	def findEmail(order)
		thisUser = User.where(id: order.user_id )
		@thisOrder = thisUser.first.email
	end
end
