require_relative '../Page/BasePage'
class LoginPage<BasePage

  def fillUserName(name)
  $action.fillInByName("txtUserName",name)
  end
  def fillPassword(password)
    $action.fillInByName("txtPwd",password)
  end
  def logIn
    $action.clickByName("btnLogin")
  end
end
