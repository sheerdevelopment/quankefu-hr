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

  private

  def set_absence_types
    @absence_types ||= Rails.cache.fetch("absence_types", :expires_in => 1.day) do
      AbsenceType.includes(:translations).all
    end
  end
end
