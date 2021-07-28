class FirstResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :third_id, :integer

  # Direct associations

  has_many   :seconds

  # Indirect associations

end
