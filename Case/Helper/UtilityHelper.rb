require_relative '../../Page/MainPage'
require_relative '../../Page/EmployeeInfoList'
require_relative '../../Page/CarrerLeaderPane'
class UtilityHelper
  @@mainpage=MainPage.new
  @@employeelistpage=EmployeeInfoList.new
  @@carrerleader=CarrerLeaderPane.new
  def self.creatAccount fristName,lastName,postion
    @@mainpage.goToEmployeeList
    $action.open($link+"/Employee/EmployeePendingList.aspx")
    # assert_equal(@@loginpage.getTitle,'Employee Info List')
    @@employeelistpage.addFulltimeEmployee
    sleep 6
    @@employeelistpage.firstName(fristName)
    @@employeelistpage.lastName(lastName)
    @@employeelistpage.localName("no")
    @@employeelistpage.passport("1223455")
    @@employeelistpage.birthday
    @@employeelistpage.country("China")
    @@employeelistpage.phoneNo("335454664")

    @@employeelistpage.onboardDate
    @@employeelistpage.expireDate
    @@employeelistpage.school("FRA")
    #@@employeelistpage.reportTo "10381"
    @@employeelistpage.position(postion)
    # Foreign Teacher
    sleep(6)
    @@employeelistpage.uncheckpendingapply
    sleep(6)
    @@employeelistpage.email(fristName+"."+lastName)
    @@employeelistpage.okButton
  end
  def self.editAccount fristName,lastName,school
    sleep(6)
    @@employeelistpage.filterName(fristName+"."+lastName)
    @@employeelistpage.searchFilter
    sleep(6)
    @@employeelistpage.clickEdit
    @@employeelistpage.school school
    @@employeelistpage.approveButton
    sleep(6)
    @@employeelistpage.filterName(fristName+"."+lastName)
    # @@employeelistpage.selectSchool school
    @@employeelistpage.searchFilter
  end
  def self.closeAndOpen
    $action.close
    $action=Action.new
    $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
  end
end