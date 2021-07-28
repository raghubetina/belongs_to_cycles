class First < ApplicationRecord
  # Direct associations

  has_many   :seconds,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    third.to_s
  end

end
