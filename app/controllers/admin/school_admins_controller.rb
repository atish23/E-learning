class Admin::SchoolAdminsController < Admin::BaseController
  before_action :authorize!
  before_action :set_school_admin, only: %i[ show edit update destroy ]

  # GET /school_admins or /school_admins.json
  def index
    @school_admins = SchoolAdmin.all
  end

  # GET /school_admins/1 or /school_admins/1.json
  def show
  end

  # GET /school_admins/new
  def new
    @school_admin = SchoolAdmin.new
  end

  # GET /school_admins/1/edit
  def edit
  end

  # POST /school_admins or /school_admins.json
  def create
    @school_admin = SchoolAdmin.new(school_admin_params)

    respond_to do |format|
      if @school_admin.save
        format.html { redirect_to admin_school_admin_url(@school_admin), notice: "School admin was successfully created." }
        format.json { render :show, status: :created, location: @school_admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_admins/1 or /school_admins/1.json
  def update
    respond_to do |format|
      if @school_admin.update(school_admin_params)
        format.html { redirect_to admin_school_admin_url(@school_admin), notice: "School admin was successfully updated." }
        format.json { render :show, status: :ok, location: @school_admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_admins/1 or /school_admins/1.json
  def destroy
    @school_admin.destroy

    respond_to do |format|
      format.html { redirect_to admin_school_admins_url, notice: "School admin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_admin
      @school_admin = SchoolAdmin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_admin_params
      params.require(:school_admin).permit(:user_id, :school_id)
    end

    def authorize!
      unless current_user_can?("school_admins_create")
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
