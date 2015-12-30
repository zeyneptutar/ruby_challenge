class Api::V1::ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
  	puts "KSKDWDE"
    @contact = Contact.new(contact_params)
    if @contact.save
        render "show.json.rabl"
    else
        render :json => [{:error => "Error occured record not created"}], :status => 500
        
    end
  end

  def update
  	if @contact.update(contact_params)
          render "show.json.rabl"
  	else
          render :json => [{:error => "Error occured record not updated"}], :status => 500
	 end
  end

  def destroy
    @contact.destroy
    render 'index.json.rabl'
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.permit(:name, :surname, :phone)
    end
end