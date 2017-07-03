require 'test/unit'
require '../Case/BaseCase'
require '../Page/MainPage'
require '../Page/EmployeeInfoList'
class NewTeacherAccount<BaseCase

@@mainpage=MainPage.new
@@employeelistpage=EmployeeInfoList.new
@@fristName="Automation"
@@lastName="teacher"+Time.now.to_s

def setup
  dir=FileUtils.mkdir("F:/sunny/result") unless File::exist?("F:/sunny/result")
  $log=File.open("F:/sunny/result/sunny/sunny.txt","a")
  $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
  login("cn.fra", "12345")
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
    @@employeelistpage.school("FRA")
    @@employeelistpage.reportTo "10381"
    @@employeelistpage.position("Foreign Teacher")
    # Foreign Teacher
    sleep(6)
    @@employeelistpage.uncheckpendingapply
    sleep(6)
    @@employeelistpage.email(@@fristName+"."+@@lastName)
     @@employeelistpage.okButton
    sleep(6)
 @@employeelistpage.filterName(@@fristName+" "+@@lastName)
    @@employeelistpage.searchFilter
    sleep(6)
   assert($action.findelementByName("ctl00$cphMain$repList$ctl00$imgShow"))
    $action.close
    $action=Action.new
    $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
    login(@@fristName+"."+@@lastName, "12345")
    assert_equal(@@loginpage.getTitle,'EF Online Academy')
    $log.puts(__method__.to_s+" -------------------pass \n")

  rescue
    $log.puts(__method__.to_s+" -------------------fail \n")
    $action.screenshot($path)
    puts ":error:#{$!}-----at:#{$@} \n"
  end
end