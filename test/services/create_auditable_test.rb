require 'test_helper'
require './app/services/create_auditable'

class CreateAudtiableTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "creates new instance of specified class" do
    assert_difference('Election.count', 1) do
      params = { name: 'Foobar', user: @user }

      CreateAuditable.call(
        klass: Election,
        params: params,
        current_user: @user,
      )
    end
  end

  test "creates new instance of AuditTrailEvent" do
    assert_difference('AuditTrailEvent.count', 1) do
      params = { name: 'Foobar', user: @user }

      CreateAuditable.call(
        klass: Election,
        params: params,
        current_user: @user,
      )
    end
  end
end
