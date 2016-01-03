class Contact < ActiveRecord::Base
	paginates_per 10
  belongs_to :user
	validates :phone,:presence => {:message => 'Just positive numbers without spaces are allowed'},
                      :numericality => true,
                      :length => { :minimum => 10, :maximum => 15 }

    def self.create_contact(name,surname,phone)
    	#firstly check if exist
    	contact = Contact.find_by_phone(phone)
  		unless contact.present?
    		Contact.create(name: name, surname: surname, phone: phone)
  		end
    end
end
