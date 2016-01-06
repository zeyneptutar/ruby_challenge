class ContactsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = current_user.contacts.order("created_at desc").page(params[:page])
    # @contacts = Contact.all.order("created_at desc").page(params[:page])
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
        redirect_to @contact, notice: 'Contact was successfully created.' 
    else
        render :new 
    end
  end

  def update
    @contact.user_id = current_user.id
  	if @contact.update(contact_params)
  	    redirect_to @contact, notice: 'Contact was successfully updated.' 
  	else
  	    render :edit
  	end
  end

  def destroy
    @contact.destroy
      redirect_to contacts_path, notice: 'Contact was successfully destroyed.' 
  end

  def upload
    uploaded_io = params[:xml_file]
    file_path = Rails.root.join('vendor', uploaded_io.original_filename) 

    File.open(file_path, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    #parse xml
    doc = Nokogiri::XML(File.open(file_path))
    doc.css("contacts contact").each do |node|
      name = node.children.css("name").text
      surname = node.children.css("lastName").text
      phone = node.children.css("phone").text.gsub(/\s+/, "")
      user_id = current_user.id
      Contact.create_contact(name,surname,phone,user_id)
    end
    redirect_to contacts_path, notice: 'Contacts were successfully imported.'
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :surname, :phone, :user_id)
    end
end
