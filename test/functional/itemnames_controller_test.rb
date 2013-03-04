require 'test_helper'

class ItemnamesControllerTest < ActionController::TestCase
  setup do
    @itemname = itemnames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itemnames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itemname" do
    assert_difference('Itemname.count') do
      post :create, itemname: { nombre: @itemname.nombre }
    end

    assert_redirected_to itemname_path(assigns(:itemname))
  end

  test "should show itemname" do
    get :show, id: @itemname
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itemname
    assert_response :success
  end

  test "should update itemname" do
    put :update, id: @itemname, itemname: { nombre: @itemname.nombre }
    assert_redirected_to itemname_path(assigns(:itemname))
  end

  test "should destroy itemname" do
    assert_difference('Itemname.count', -1) do
      delete :destroy, id: @itemname
    end

    assert_redirected_to itemnames_path
  end
end
