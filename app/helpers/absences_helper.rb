module AbsencesHelper
  STATUS_COLOURS = {
    AbsenceStatus::PENDING => "info",
    AbsenceStatus::APPROVED => "success",
    AbsenceStatus::REJECTED => "danger",
    AbsenceStatus::CANCELLED => "warning"
  }

  def label_colour(absence)
    STATUS_COLOURS[absence.status.id]
  end
end
