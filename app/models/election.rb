class Election < ApplicationRecord
  include Auditable
  has_many :questions
  belongs_to :user

  serialize :settings, Hash

  def visibility
    settings[:visibility]
  end

  def visibility=(value)
    settings[:visibility] = value
  end
end
