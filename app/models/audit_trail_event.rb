class AuditTrailEvent < ApplicationRecord
  belongs_to :auditable, polymorphic: true
  belongs_to :user

  serialize :event_changes, Hash
end
