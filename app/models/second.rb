class Second < ApplicationRecord
  # Direct associations

  has_many   :thirds,
             dependent: :destroy

  belongs_to :first

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first.to_s
  end
end
