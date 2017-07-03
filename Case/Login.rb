require 'test/unit'
require '../Page/LoginPage'
require '../Case/BaseCase'
class Login <BaseCase
  @@loginpage=LoginPage.new
  def test_login
    # login with user cn.fra
logIn()

  end
  def logIn
    @@loginpage.fillUserName("cn.fra")
    @@loginpage.fillPassword("12345")
    @@loginpage.logIn
    assert_equal(@@loginpage.getTitle,'EF Online Academy')
  end
end