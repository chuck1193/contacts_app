class Api::ContactsController < ApplicationController
  def first_contact
    @contact = Contact.first_contact
    render 'contact.json.jbuilder'
  end
end
