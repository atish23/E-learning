class EnrolmentsController < ApplicationController
  def create
    result = ::EnrolmentService.create_enrollment(params[:batch_id], current_user.id)
    if result[:success]
      flash[:success] = result[:message]
    else
      flash[:error] = result[:message]
    end
    redirect_to batches_path
  end
end
