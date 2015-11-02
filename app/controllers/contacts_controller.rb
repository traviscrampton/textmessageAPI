class ContactsController < ApplicationController
  def new
    @addressbook = Addressbook.find(params[:addressbook_id])
    @contact = Contact.new
  end

  def create
    @addressbook = Addressbook.find(params[:addressbook_id])
    @contact = @addressbook.contacts.new(contact_params)
    if @contact.save
      flash[:notice]="Congratulations You Did It We Are Impressed"
      redirect_to addressbook_path(@addressbook)
    else
      render :new
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :relationship, :phonenumber, :addressbook_id)
  end
end
