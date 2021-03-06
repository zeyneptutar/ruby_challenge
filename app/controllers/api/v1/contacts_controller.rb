class Api::V1::ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    # @contacts = Contact.all
    @contacts = current_user.contacts.order("created_at desc")
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
        render "show.rabl"
    else
        render :json => [{:error => "Error occured record not created"}], :status => 500
        
    end
  end

  def update
    @contact.user_id = current_user.id
  	if @contact.update(contact_params)
          render "show.rabl"
  	else
          render :json => [{:error => "Error occured record not updated"}], :status => 500
	 end
  end

  def destroy
    @contact.destroy
    render 'index.rabl'
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.permit(:name, :surname, :phone, :user_id)
    end
end