class Second < ApplicationRecord
  # Direct associations

  belongs_to :first

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first.to_s
  end

end
