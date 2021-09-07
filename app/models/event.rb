class Event < ApplicationRecord
  belongs_to :artist
  belongs_to :user

  before_save :set_month

  private

  def set_month
    self.month = I18n.t("date.month_names")[date.month]
  end


end
