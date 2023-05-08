class Admin::SchoolsController < Admin::BaseController
  before_action :set_school, only: %i[ show edit update destroy ]
  before_action -> { require_permission('schools_create') },  only: %i[new create destroy]

  # GET /schools or /schools.json
  def index
    if current_user.schooladmin?
      @schools = current_user.schools
    else
      @schools = School.all
    end
  end

  # GET /schools/1 or /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools or /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to admin_school_url(@school), notice: "School was successfully created." }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1 or /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to admin_school_url(@school), notice: "School was successfully updated." }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1 or /schools/1.json
  def destroy
    @school.destroy

    respond_to do |format|
      format.html { redirect_to admin_schools_url, notice: "School was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      if current_user.admin?
        @school = School.find(params[:id])
      else
        @school = current_user.schools.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def school_params
      params.require(:school).permit(:name, :address, :contact_details)
    end
end
