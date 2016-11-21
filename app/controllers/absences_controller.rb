class AbsencesController < ApplicationController
  before_action :set_absence_types, only: [:new, :edit]

  def show
  end

  def index
  end

  def edit
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
