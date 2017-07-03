require 'test/unit'
require '../Case/BaseCase'
require '../Page/ModuleManagePage'
class AddModuleList < BaseCase

@@modulemanagepage=ModuleManagePage.new
  # Fake test
  def test_AddModuleList
    # login("cn.fra", "12345")
begin
    @@moduleName=$title
    @@title=$question
    $action.open($link+"/Course/ModuleList.aspx")
    assert_equal(@@loginpage.getTitle,"EF Online Academy")
    @@modulemanagepage.addNew
    @@modulemanagepage.moduleName @@moduleName
    @@modulemanagepage.uniqueId Time.now.to_s
    @@modulemanagepage.tag
    @@modulemanagepage.courseList @@moduleName,$task
    @@modulemanagepage.ok
    sleep 6
    @@modulemanagepage.courseNameFilter(@@moduleName)
    @@modulemanagepage.search
    sleep 3
    assert($action.findelementByName("ctl00$cphMain$rptList$ctl00$imgBtnEdit"))
    $log.puts(__method__.to_s+" -------------------pass \n")

  rescue
    $log.puts(__method__.to_s+" -------------------fail \n")
    $action.screenshot($path)
    puts ":error:#{$!}-----at:#{$@} \n"
  end
  end
end