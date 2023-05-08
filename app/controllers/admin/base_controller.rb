class Admin::BaseController < ApplicationController
  layout 'admin'
  include AuthenticationHelper
  before_action :authenticate_user!
  before_action :require_school_admin

end
