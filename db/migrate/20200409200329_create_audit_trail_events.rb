class CreateAuditTrailEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :audit_trail_events do |t|
      t.integer :auditable_id
      t.references :user, foreign_key: true
      t.text :auditable_type
      t.text :event_changes

      t.timestamps
    end

    add_index :audit_trail_events, [:auditable_type, :auditable_id]
  end
end
