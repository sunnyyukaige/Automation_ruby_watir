require 'test/unit'
require '../Page/LoginPage'
require '../Case/BaseCase'
class Login <BaseCase

  def test
    # login with user cn.fra
  loginpage=LoginPage.new
    loginpage.fillUserName("cn.fra")
    loginpage.fillPassword("12345")
    loginpage.logIn
   assert_equal(loginpage.getTitle,'EF Online Academy')
  end
end