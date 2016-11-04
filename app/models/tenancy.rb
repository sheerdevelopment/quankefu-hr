class Tenancy < ApplicationRecord
  belongs_to :user

  validates_presence_of :tenants, :term, :rent, :deposit,
                        :start_date, :end_date, :name
  validate :end_date_after_start_date?

  scope :endings, -> { where("now() BETWEEN (end_date - INTERVAL '2 months') AND end_date") }

  alias_attribute :expiry_date, :end_date

  private

  def end_date_after_start_date?
    if end_date && start_date && end_date < start_date
      errors.add :end_date, "must be after start date."
    end
  end
end
