class Third < ApplicationRecord
  # Direct associations

  belongs_to :second

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    second.to_s
  end

end
