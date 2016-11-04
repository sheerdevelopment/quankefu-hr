class CertificatesController < ApplicationController
  def new
    @certificate = authorize Certificate.new
    @doc_types = DocType.all
  end

  def edit
  end

  def create
    @certificate = authorize Certificate.new(certificate_params.merge(:user => current_user))
    if @certificate.save
      flash[:success] = "Certificate is uploaded successfully."
      redirect_to root_path
    else
      @doc_types = DocType.all
      render "new"
    end
  end

  def destroy
    @certificate = authorize Certificate.find(params[:id])
    if @certificate.destroy
      flash[:success] = "Certificate is deleted successfully."
    end
    redirect_to root_path
  end

  def show
    @certificate = authorize Certificate.find(params[:id])
  end

  def index
    @certificates = policy_scope(Certificate).paginate(:page => params[:page])
  end

  private

  def certificate_params
    params.require(:certificate).permit(:name, :doc_type_id, :expiry_date, :file)
  end
end
