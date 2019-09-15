require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get tasks_name_url
    assert_response :success
  end

  test "should get content:text" do
    get tasks_content:text_url
    assert_response :success
  end

end
