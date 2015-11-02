class AddressbooksController < ApplicationController
  def index
    @addressbooks = Addressbook.all
  end

  def new
    @addressbook = Addressbook.new
  end

  def create
    @addressbook = Addressbook.new(addressbook_params)
    if @addressbook.save
      flash[:notice] = "Addressbook is saved!"
      redirect_to addressbooks_path
    else
      render :new
    end
  end

  def show
    @addressbook = Addressbook.find(params[:id])
  end

private
  def addressbook_params
    params.require(:addressbook).permit(:owner)
  end
end
