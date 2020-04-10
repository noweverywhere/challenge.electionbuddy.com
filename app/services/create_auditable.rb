class CreateAuditable
  def self.call(*args)
    new(*args).call
  end

  def call
    instance = create_instance
    write_auditlog
    instance
  end
   
  private

  def initialize(klass:, params:, current_user:)
    @klass = klass
    @params = params
    @current_user = current_user
  end

  def create_instance
    @instance ||= @klass.create(@params)
  end

  def write_auditlog
    AuditTrailEvent.create(
      user: @current_user,
      auditable: @instance,
    )
  end
end
