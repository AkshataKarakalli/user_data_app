class User
  include Mongoid::Document
  field :firstName, type: String
  field :lastName, type: String
  field :email, type: String

  validates :firstName, uniqueness: true, presence: true
  validates :lastName, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
end
