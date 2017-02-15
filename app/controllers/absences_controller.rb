class AbsencesController < ApplicationController
  include SharedConcern

  before_action :set_absence_types, only: [:new, :edit]

  def index
    @pending_absences = policy_scope(Absence).includes(ABSENCE_PRELOAD_FIELDS).
                          where(absence_status_id: AbsenceStatus::PENDING).all
    @absences = policy_scope(Absence).includes(ABSENCE_PRELOAD_FIELDS).
                  where.not(absence_status_id: AbsenceStatus::PENDING).
                  paginate(page: params[:page])
  end

  def edit
    @absence = authorize Absence.find(params[:id])
  end

  def new
    @absence = Absence.new
  end

  def create
    user = current_user
    @absence = Absence.new(absence_params.merge(absence_status_id: AbsenceStatus::PENDING, user: user))
    if @absence.save
      AbsenceMailer.request_email(user: user, absence: @absence, admin: User.admins.first).deliver
      flash[:success] = "Absence request is submitted, waiting for approval."
      redirect_to absences_path
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
    @absence = authorize Absence.includes(:user).find(params[:absence_id])
    if @absence.update_attributes(absence_status_id: params[:status])
      flash[:success] = "Absence is updated successfully."
      AbsenceMailer.status_email(user: @absence.user, absence: @absence).deliver
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
