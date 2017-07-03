require 'test/unit'
require '../Case/BaseCase'
require '../Page/MainPage'
require '../Page/EmployeeInfoList'
class EditAccount<BaseCase

@@mainpage=MainPage.new
@@employeelistpage=EmployeeInfoList.new
@@fristName="Automationown"
@@lastName="test"

def setup
  dir=FileUtils.mkdir("F:/sunny/result") unless File::exist?("F:/sunny/result")
  txt=File.open("F:/sunny/result/sunny/sunny.txt","a")
  $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
  login("cn.own", "12345")
  readConfig
end
  def test_editAccount
    @@mainpage.goToEmployeeList
    $action.open($link+"/Employee/EmployeePendingList.aspx")
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
    @@employeelistpage.school("OWN")
    # @@employeelistpage.reportTo "10422"
    @@employeelistpage.position("Foreign Teacher")
    # Foreign Teacher
    sleep(6)
    @@employeelistpage.uncheckpendingapply
    sleep(6)
    @@employeelistpage.email("Automationown.teacher2")
     @@employeelistpage.okButton
    sleep(6)
 @@employeelistpage.filterName(@@fristName+" "+@@lastName)
    @@employeelistpage.searchFilter
    sleep(6)
   assert($action.findelementByName("ctl00$cphMain$repList$ctl00$imgShow"))
  end
end