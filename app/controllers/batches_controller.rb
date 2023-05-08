class BatchesController < ApplicationController
  def index
    @batches = Batch.left_joins(:enrolment_requests)
                   .where(enrolment_requests: { id: nil })
                   .where('start_date > ?', Date.today)
  end

  def current_user_batches
    @batches = current_user.enrolment_requests.includes(:batch).map(&:batch)
  end

  def show_users
    @batch = Batch.find(params[:id])
    @users = @batch.users.where.not(id: current_user.id)
  end
end
