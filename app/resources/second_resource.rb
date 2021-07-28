class SecondResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :first_id, :integer

  # Direct associations

  has_many   :thirds

  belongs_to :first

  # Indirect associations

end
