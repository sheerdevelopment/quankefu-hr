class TenanciesController < ApplicationController
  def new
    @tenancy = authorize Tenancy.new
  end

  def edit
    @tenancy = authorize Tenancy.find(params[:id])
  end

  def index
    @tenancies = policy_scope(Tenancy).paginate(:page => params[:page])
  end

  def create
    @tenancy = authorize Tenancy.new(tenancy_params)
    if @tenancy.save
      flash[:success] = "Tenancy is added successfully."
      redirect_to root_path
    else
      render "new"
    end
  end

  def update
    @tenancy = authorize Tenancy.find(params[:id])
    if @tenancy.update_attributes(tenancy_params)
      flash[:success] = "Tenancy is updated successfully."
    end
    render "edit"
  end

  def show
    @tenancy = authorize Tenancy.find(params[:id])
  end

  private

  def tenancy_params
    {
      term: params[:tenancy][:term],
      start_date: params[:tenancy][:start_date],
      end_date: params[:tenancy][:end_date],
      rent: params[:tenancy][:rent],
      deposit: params[:tenancy][:deposit],
      tenants: params[:tenancy][:tenants].join(","),
      name: params[:tenancy][:name],
      user: current_user
    }.reject { |key, value| value.blank? }
  end
end
