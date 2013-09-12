class ContactInquiriesController < ApplicationController
  before_action :set_contact_inquiry, only: [:show, :edit, :update, :destroy]

  # GET /contact_inquiries
  # GET /contact_inquiries.json
  def index
    @contact_inquiries = ContactInquiry.all
  end

  # GET /contact_inquiries/1
  # GET /contact_inquiries/1.json
  def show
  end

  # GET /contact_inquiries/new
  def new
    @contact_inquiry = ContactInquiry.new
  end

  # GET /contact_inquiries/1/edit
  def edit
  end

  # POST /contact_inquiries
  # POST /contact_inquiries.json
  def create
    @contact_inquiry = Contact.new(contact_inquiry_params)

    respond_to do |format|
      if @contact_inquiry.save
        format.html { redirect_to @contact_inquiry, notice: 'Contact inquiry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact_inquiry }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_inquiries/1
  # PATCH/PUT /contact_inquiries/1.json
  def update
    respond_to do |format|
      if @contact_inquiry.update(contact_inquiry_params)
        format.html { redirect_to @contact_inquiry, notice: 'Contact inquiry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_inquiries/1
  # DELETE /contact_inquiries/1.json
  def destroy
    @contact_inquiry.destroy
    respond_to do |format|
      format.html { redirect_to contact_inquiries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_inquiry
      @contact_inquiry = ContactInquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_inquiry_params
      params.require(:contact_inquiry).permit(:email, :subject, :description, :first_name, :last_name)
    end
end
