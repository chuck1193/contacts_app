class Api::ContactsController < ApplicationController
  def first_contact
    @contact = Contact.first_contact
    render 'contact.json.jbuilder'
  end

  def index
    @contacts = Contact.all
    render 'index.json.jbuilder'
  end

  def create
    @contacts = Contact.new(
                              first_name: params[:first_name],
                              middle_name: params[:middle_name],
                              last_name: params[:last_name],
                              email: params[:email],
                              phone_number: params[:phone_number],
                              bio: params[:bio]
                            )
    if @contacts.save
      render 'show.json.jbuilder'
    else json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    contact_id = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @contact.erros.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: {message: "Successfully removed contact."}
  end

end
 