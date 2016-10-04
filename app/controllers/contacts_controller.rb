class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.where(nil)
    @contacts = @contacts.vt(params[:vt]) if params[:vt].present?
    @contacts = @contacts.cl(params[:cl]) if params[:cl].present?
    @contacts = @contacts.namesearch(params[:name]) if params[:name].present?
    @contacts = @contacts.emailsearch(params[:email]) if params[:email].present?
    @contacts = @contacts.schoolsearch(params[:school]) if params[:school].present?
    @contacts = @contacts.order('name asc')
  end

  def import
    Contact.import(params[:file].path)
    redirect_to root_url, notice: "Contatos importados com sucesso!"
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @calls = Call.where(" contact_id = ?", params[:id])
    @visits = Visit.where(" contact_id = ?", params[:id])
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contato criado com sucesso!' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contato alterado  com sucesso!' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Contato excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :parents, :phonenumber1, :phonenumber2)
    end
end
