require 'test/unit'
require '../Case/BaseCase'
require '../Page/CourseDefinePage'
class AddCourseDefine < BaseCase


@@coursedefinepage=CourseDefinePage.new
  def test_AddCourseDefine

begin
    @@courseName=$title
    @@title=$question
    $action.open($link+"/Course/CourseDefineList.aspx")
    assert_equal(@@loginpage.getTitle,"EF Online Academy")

    @@coursedefinepage.addNew
    @@coursedefinepage.courseName @@courseName
    @@coursedefinepage.description @@title
    @@coursedefinepage.uniqueId Time.now.to_s
    @@coursedefinepage.isTask $task
    @@coursedefinepage.trainingTime "10"
    @@coursedefinepage.examDays "10"
    @@coursedefinepage.testTime "10"
    @@coursedefinepage.tag
    @@coursedefinepage.trainingMaterial @@courseName
    @@coursedefinepage.testPaper @@title
    @@coursedefinepage.ok
    sleep 6
    @@coursedefinepage.courseNameFilter(@@courseName)
    @@coursedefinepage.includeTask
    @@coursedefinepage.search
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