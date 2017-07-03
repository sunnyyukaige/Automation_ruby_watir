require 'test/unit'
require '../Case/BaseCase'
require '../Page/MainPage'
require '../Page/EmployeeInfoList'
require '../Page/CarrerLeaderPane'
class TakeTask_S3 < BaseCase

  @@mainpage=MainPage.new
  @@employeelistpage=EmployeeInfoList.new
  @@carrerleader=CarrerLeaderPane.new
  @@fristName="Automation"
  @@lastName="Guest"+Time.now.to_s
  def setup
    dir=FileUtils.mkdir("F:/sunny/result") unless File::exist?("F:/sunny/result")
    $log=File.open("F:/sunny/result/sunny/sunny.txt","a")
    $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
    login("cn.fra", "12345")
    readConfig
  end


  def test_TakeTask_S3
     begin

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
   @@employeelistpage.position("Guest")
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
   @@carrerleader.applyTask
   $action.close
   $action=Action.new
   $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
    login("automation.test", "12345")
    @@mainpage.clickTaskApplied
    @@mainpage.clickView
    sleep 3
    @@mainpage.clickFinish
    sleep 12

    $action.close
    $action=Action.new
    $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
    login(@@fristName+"."+@@lastName, "12345")
    @@mainpage.goToCarrerLeader
    sleep 6
    assert(@@carrerleader.checkPass)
    $log.puts(__method__.to_s+" -------------------pass \n")

  rescue
    $log.puts(__method__.to_s+" -------------------fail \n")
    $action.screenshot($path)
    puts ":error:#{$!}-----at:#{$@} \n"
  end
  end
  end
