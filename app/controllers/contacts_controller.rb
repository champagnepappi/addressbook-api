class ContactsController < ApplicationController
  def index
    response = Contact.all
    render json: response, status: :ok
  end

  def create
    response = Contact.create(contact_params)
    render json: response, status: :created
  end

  private
  def contact_params
    params.require(:data).permit(:name, :phone, :email, :address)
  end
end
