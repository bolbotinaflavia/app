require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'users new' do
    get new_user_path
    assert_response :success
    assert_select 'label', 'Email'
    assert_select 'label', 'Password'
  end

  test 'users create - no email and no password' do
    initial_user_count = User.count
    post users_path, params: { user: { name: 'George' ,gender: 'male',phone_number:'073456738',age:'34'} }
    assert_response :success
    assert_select 'div', "Password can't be blank"
    assert_select 'div', "Email can't be blank"
    assert_equal User.count, initial_user_count
  end

  test 'users create - no email' do
    initial_user_count = User.count
    post users_path, params: { user: { name: 'George', password: '123',phone_number: '0734567892',gender: 'other',age:30 } }
    assert_response :success
    assert_equal User.count, initial_user_count
  end

  test 'users create - valid' do
    initial_user_count = User.count
    post users_path, params: { user: { name: 'User', password: '123', email: 'user@d.com',age:'23',phone_number:'0734567891',gender:'other'} }
    assert_response :redirect
    assert_equal User.count, initial_user_count +1
    user = User.last
    assert_equal User.name, "User"
  end
  test 'users index' do
    user=User.create!(email:'user@d.com',password:'123',name:'User',gender:'other',phone_number:'0789102345',age:'24')
    post login_path, params: {email:user.email,password:user.password}
    assert_response :redirect
    get users_path
    assert_response :success
  end
  test 'users not logged in' do
    get users_path
    assert_response :redirect
    get login_path
    assert_response :success
    assert_select "h1", "sign in"
  end
end