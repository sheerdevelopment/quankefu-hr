class AbsencesController < ApplicationController
  include SharedConcern

  before_action :set_absence_types, only: [:new, :edit]

  def index
    @absences = policy_scope(Absence).includes(ABSENCE_PRELOAD_FIELDS).paginate(page: params[:page])
  end

  def edit
    @absence = authorize Absence.find(params[:id])
  end

  def new
    @absence = Absence.new
  end

  def create
    @absence = Absence.new(absence_params.merge(absence_status_id: AbsenceStatus::PENDING, user: current_user))
    if @absence.save
      flash[:success] = "Absence request is submitted, waiting for approval."
      redirect_to new_absence_path
    else
      set_absence_types
      render :new
    end
  end

  def update
    @absence = authorize Absence.find(params[:id])
    if @absence.update_attributes(update_params)
      flash[:success] = "Absence request is cancelled."
      redirect_to absences_path
    else
      render :edit
    end
  end

  def admin_action
    @absence = authorize Absence.find(params[:absence_id])
    if @absence.update_attributes(absence_status_id: params[:status])
      flash[:success] = "Absence is updated successfully."
    end
    redirect_to absences_path
  end

  private

  def set_absence_types
    @absence_types ||= Rails.cache.fetch("absence_types", :expires_in => 1.day) do
      AbsenceType.includes(:translations).all
    end
  end

  def absence_params
    params.require(:absence).permit(:absence_type_id, :start, :end, :comments)
  end
end
