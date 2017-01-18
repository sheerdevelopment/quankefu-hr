class DiariesController < ApplicationController
  before_action :set_projects, only: [:new, :edit]

  def new
    @diary = Diary.new
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def index
    @diaries = Diary.paginate(page: params[:page])
  end

  def create
    @diary = Diary.new(diary_params.merge(employee: current_user.employee))
    if @diary.save
      flash[:success] = "Diary is recorded."
      redirect_to new_diary_path
    else
      render :new
    end
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update_attributes(diary_params)
      flash[:success] = "Diary is updated."
      redirect_to diaries_path
    else
      render :edit
    end
  end

  private

  def set_projects
    @projects ||= Rails.cache.fetch("in_progress_projects", :expires_in => 1.day) do
      Project.where(project_status_id: ProjectStatus::IN_PROGRESS).all
    end
  end

  def diary_params
    params.require(:diary).permit(:start, :end, :notes, :project_id)
  end
end
