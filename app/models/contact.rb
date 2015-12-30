class Contact < ActiveRecord::Base
	validates :phone,:presence => {:message => 'Just positive numbers without spaces are allowed'},
                      :numericality => true,
                      :length => { :minimum => 10, :maximum => 15 }
end
