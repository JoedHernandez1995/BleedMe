class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    @request.email = current_user.email
    if @request.blood_type_needed == "A+"
      @request.compatible_blood_types = "A+,A-,O+,O-"

    elsif @request.blood_type_needed == "B+"
      @request.compatible_blood_types = "B+,B-,O+,O-"

    elsif @request.blood_type_needed == "AB+"
      @request.compatible_blood_types = "A+,B+,AB+,O+,A-,B-,AB-,O-"

    elsif @request.blood_type_needed == "O+"
      @request.compatible_blood_types = "O+,O-"

    elsif @request.blood_type_needed == "A-"
      @request.compatible_blood_types = "A-,O-"

    elsif @request.blood_type_needed == "B-"
      @request.compatible_blood_types = "B-,O-"

    elsif @request.blood_type_needed == "AB-"
      @request.compatible_blood_types = "A-,B-,AB-,O-"

    elsif @request.blood_type_needed == "O-"
      @request.compatible_blood_types = "O-"
    end
    if @request.save
      flash[:success] = "Request was sucessfully created"
      redirect_to requests_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:name, :phone_number, :email, :needed_for, :blood_type_needed, :blood_units_needed, :date_needed, :compatible_blood_types, :message)
    end
end
