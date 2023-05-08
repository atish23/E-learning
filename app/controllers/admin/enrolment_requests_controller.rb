class Admin::EnrolmentRequestsController < Admin::BaseController
  before_action :set_enrolment_request, only: %i[ show edit update destroy approve reject ]

  # GET /enrolment_requests or /enrolment_requests.json
  def index
    if current_user.admin?
      @enrolment_requests = EnrolmentRequest.all
    else
      @enrolment_requests = EnrolmentRequest.joins(batch: { course: :school })
                                        .where(schools: { id: current_user.schools.pluck(:id) })
    end
  end

  # GET /enrolment_requests/1 or /enrolment_requests/1.json
  def show
  end

  # GET /enrolment_requests/new
  def new
    @enrolment_request = EnrolmentRequest.new
  end

  # GET /enrolment_requests/1/edit
  def edit
  end

  # POST /enrolment_requests or /enrolment_requests.json
  def create
    @enrolment_request = EnrolmentRequest.new(enrolment_request_params)

    respond_to do |format|
      if @enrolment_request.save
        format.html { redirect_to admin_enrolment_request_url(@enrolment_request), notice: "Enrolment request was successfully created." }
        format.json { render :show, status: :created, location: @enrolment_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrolment_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrolment_requests/1 or /enrolment_requests/1.json
  def update
    respond_to do |format|
      if @enrolment_request.update(enrolment_request_params)
        format.html { redirect_to admin_enrolment_request_url(@enrolment_request), notice: "Enrolment request was successfully updated." }
        format.json { render :show, status: :ok, location: @enrolment_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enrolment_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolment_requests/1 or /enrolment_requests/1.json
  def destroy
    @enrolment_request.destroy

    respond_to do |format|
      format.html { redirect_to admin_enrolment_requests_url, notice: "Enrolment request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def approve
    @enrolment_request.update(status: "approved")
    redirect_to admin_enrolment_requests_path, notice: "Enrolment request approved."
  end

  def reject
    @enrolment_request.update(status: "rejected")
    redirect_to admin_enrolment_requests_path, notice: "Enrolment request rejected."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrolment_request
      @enrolment_request = EnrolmentRequest.find(params[:id])
      if current_user.admin?
        @batches = Batch.all
      else
        @batches = Batch.joins(:course => :school)
        .where(:schools => {:id => current_user.schools.pluck(:id)})
      end
    end

    # Only allow a list of trusted parameters through.
    def enrolment_request_params
      params.require(:enrolment_request).permit(:batch_id, :student_id, :status)
    end
end
