require 'test/unit'
require '../Case/BaseCase'
require '../Page/MainPage'
require '../Page/EmployeeInfoList'
require '../Page/CarrerLeaderPane'
class TakeTraining_S2 < BaseCase

  @@mainpage=MainPage.new
  @@employeelistpage=EmployeeInfoList.new
  @@carrerleader=CarrerLeaderPane.new
  @@fristName="Automation"
  @@lastName="cleaner"+Time.now.to_s
  def setup
    dir=FileUtils.mkdir("F:/sunny/result") unless File::exist?("F:/sunny/result")
    $log=File.open("F:/sunny/result/sunny/sunny.txt","a")
    $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
    login("cn.fra", "12345")
    readConfig
  end


  def test_TakeTraining_S2
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
    #@@employeelistpage.reportTo "10381"
    @@employeelistpage.position("CLEANER")
    # Foreign Teacher
    sleep(6)
    @@employeelistpage.uncheckpendingapply
    sleep(6)
    @@employeelistpage.email(@@fristName+"."+@@lastName)
    @@employeelistpage.okButton
    sleep(6)

    $action.close
    $action=Action.new
    $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
     login(@@fristName+"."+@@lastName, "12345")
    # login("Automation.cleaner2015-01-13 17:52:02 +0800","12345")
    assert_equal(@@loginpage.getTitle,'EF Online Academy')

    @@mainpage.goToCarrerLeader
    sleep 8
    @@carrerleader.clickTraningPlan
    @@carrerleader.clickTrainingByName "automation_S3"
    sleep 18
    @@carrerleader.takeTraining
    sleep 18
    @@carrerleader.takeExam
    sleep 18
    @@carrerleader.takeChoose "0"
    @@carrerleader.handIn
    sleep 18
    num=@@mainpage.getCompletedNumber
    assert(num>"0","the taked training did not display on completed tag")
    $log.puts(__method__.to_s+" -------------------pass \n")

  rescue
    $log.puts(__method__.to_s+" -------------------fail \n")
    $action.screenshot($path)
    puts ":error:#{$!}-----at:#{$@} \n"
  end
end