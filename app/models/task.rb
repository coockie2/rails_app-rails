class Task < ApplicationRecord
  before_validation :set_nameless_name
  validates :name, presence: true, length: {maximum: 30}
  validate :validate_name_not_include_comma

  private

  def set_nameless_name
    self.name = "名前なし" if name.blank?
  end

  def validate_name_not_include_comma
    errors.add(:name, "にカンマを含めることはできません") if name&.include?(',')
  end
end
