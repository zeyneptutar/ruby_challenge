class Contact < ActiveRecord::Base
	paginates_per 10
  belongs_to :user
	validates :phone,:presence => {:message => 'Just positive numbers without spaces are allowed'},
                      :numericality => true,
                      :length => { :minimum => 10, :maximum => 15 },
                      :uniqueness => true

    def self.create_contact(name,surname,phone,user_id)
    	#firstly check if exist
    	contact = Contact.find_by_phone(phone)
  		unless contact.present?
    		Contact.create(name: name, surname: surname, phone: phone, user_id: user_id)
  		end
    end
end
