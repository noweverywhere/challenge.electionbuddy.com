module Auditable
  extend ActiveSupport::Concern

  included do
    has_many :audit_trail_events, as: :auditable
  end
end
