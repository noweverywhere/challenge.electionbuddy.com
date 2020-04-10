module Auditor
  extend ActiveSupport::Concern

  included do
    after_update :write_audit_trail
    # add other hooks for after_destroy, after_save etc
    # and have those hooks update associated records
    # for example when a question is added or removed
    # from an election
    has_many :audit_trail_events, as: :auditable
    attr_accessor :current_user
  end

  def update(*params) 
    # Not loving the idea of overwriting such an important activerecord method
    # the same could be done for create, destroy etc.
    # make sure all other params that are passed are handled correctly as well
    @current_user = params[:current_user]
    super(params.except(:current_user))
  end

  def write_audit_trail
    AuditTrailEvent.create(
      auditable_id: self.id,
      auditable_type: self.class.to_s,
      event_changes: self.saved_changes,
      user_id: @current_user.id,
    )
  end

  def auditable_update(params)
    @current_user = params[:current_user]
    self.update(params.except(:current_user))
  end
end
