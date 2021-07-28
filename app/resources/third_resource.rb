class ThirdResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :second_id, :integer

  # Direct associations

  has_many   :firsts

  belongs_to :second

  # Indirect associations

end
