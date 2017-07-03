require 'test/unit'
require '../Page/LoginPage'
require '../Page/MainPage'
require '../Page/EmployeeInfoList'
require '../Case/BaseCase'
class DeleteAccount < BaseCase

  @@loginpage=LoginPage.new
  @@mainpage=MainPage.new
  @@employeelistpage=EmployeeInfoList.new
  @@employName="Automation_test"
  # Fake test
  def test_deleteAccount
    login("cn.fra", "12345")

    @@mainpage.goToEmployeeList

    $action.open($link+"/Employee/EmployeePendingList.aspx")
    assert_equal(@@loginpage.getTitle,'Employee Info List')
    @@employeelistpage.filterName(@@employName)
    @@employeelistpage.searchFilter
    sleep(6)
    @@employeelistpage.delete

  end
end