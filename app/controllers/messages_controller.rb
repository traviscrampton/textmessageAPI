class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @contact = Contact.find(params[:contact_id])
    @message = Message.new
    @contacts = Contact.all
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @message = @contact.messages.new(message_params)
    @message.to = @contact.phonenumber
    @message.from = "8052508054"
    if @message.save
      flash[:notice] = "You did it"
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

private
  def message_params
    params.require(:message).permit(:body, :from, :to)
  end
end
