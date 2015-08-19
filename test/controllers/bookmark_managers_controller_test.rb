require 'test_helper'

class BookmarkManagersControllerTest < ActionController::TestCase
  setup do
    @bookmark_manager = bookmark_managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookmark_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookmark_manager" do
    assert_difference('BookmarkManager.count') do
      post :create, bookmark_manager: { name: @bookmark_manager.name }
    end

    assert_redirected_to bookmark_manager_path(assigns(:bookmark_manager))
  end

  test "should show bookmark_manager" do
    get :show, id: @bookmark_manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bookmark_manager
    assert_response :success
  end

  test "should update bookmark_manager" do
    patch :update, id: @bookmark_manager, bookmark_manager: { name: @bookmark_manager.name }
    assert_redirected_to bookmark_manager_path(assigns(:bookmark_manager))
  end

  test "should destroy bookmark_manager" do
    assert_difference('BookmarkManager.count', -1) do
      delete :destroy, id: @bookmark_manager
    end

    assert_redirected_to bookmark_managers_path
  end
end
