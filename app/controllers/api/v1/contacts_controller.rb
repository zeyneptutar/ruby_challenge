class Api::V1::ContactsController < ApplicationController

	def index
		@contacts = Contact.all
	end

	def show
		@contact = Contact.find(params[:id])
	end

end