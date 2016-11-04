class StaticPagesController < ApplicationController
  def home
    @tenancies = current_user.tenancies.paginate(:page => params[:page])
    @certificates = current_user.certificates
  end
end
