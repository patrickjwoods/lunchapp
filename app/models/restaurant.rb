# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  menu_link  :string(255)
#  home_link  :string(255)
#  day        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Restaurant < ActiveRecord::Base
end
