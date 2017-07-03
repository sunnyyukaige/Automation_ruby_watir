require 'test/unit'

require '../Case/BaseCase'
require '../Page/MainPage'
require '../Page/EmployeeInfoList'
class EditSchoolAccount<BaseCase


  @@mainpage=MainPage.new
  @@employeelistpage=EmployeeInfoList.new
  @@fristName="Automationown"
  @@lastName="test"
  def setup
    $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
    login("automation.schooladmin", "12345")
  end
  def test_editAccount


    @@mainpage.goToEmployeeList

    $action.open($link+"/Employee/EmployeeMaintainList.aspx")
    assert_equal(@@loginpage.getTitle,'Employee Info List')
    @@employeelistpage.addFulltimeEmployee
    #sleep(6000)
    @@employeelistpage.firstName(@@fristName)
    @@employeelistpage.lastName(@@lastName)
    @@employeelistpage.localName("no")
    @@employeelistpage.passport("1223455")
    @@employeelistpage.birthday
    @@employeelistpage.country("China")
    @@employeelistpage.phoneNo("335454664")

    @@employeelistpage.onboardDate
    @@employeelistpage.expireDate
    @@employeelistpage.school("FRA")
    @@employeelistpage.reportTo "10422"
    @@employeelistpage.position("Foreign Teacher")
    # Foreign Teacher
    sleep(6)
    @@employeelistpage.uncheckpendingapply
    sleep(6)
    @@employeelistpage.email("Automation.teacher2")
    @@employeelistpage.okButton
    sleep(6)
    @@employeelistpage.filterName(@@fristName+" "+@@lastName)
    @@employeelistpage.searchFilter
    sleep(6)
    assert($action.findelementByName("ctl00$cphMain$repList$ctl00$imgShow"))

  end
end