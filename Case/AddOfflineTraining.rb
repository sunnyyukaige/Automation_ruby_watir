require 'test/unit'
require '../Case/BaseCase'
require '../Page/OfflineTrainingPage'
class AddOfflineTraining < BaseCase
@@offlinepage=OfflineTrainingPage.new


  # Fake test
  def test_AddOfflineTraining
    begin
      # login("cn.own", "12345")
      @@title=$title
      $action.open($link+"/Course/OtherTrainCourse.aspx")
      assert_equal(@@loginpage.getTitle,"EF Online Academy")
      @@offlinepage.addNew
      @@offlinepage.offlineTrainingName @@title
      @@offlinepage.beginDate Time.now.strftime "%m/%d/%Y %H:%M"
      @@offlinepage.endDate (Time.now+259200).strftime "%m/%d/%Y %H:%M"
      @@offlinepage.organizer "sunny"
      @@offlinepage.hasPaper
      @@offlinepage.description @@title
      @@offlinepage.trainingCourseList @@title,"automation.teacher"
      @@offlinepage.ok
      @@offlinepage.titleFilter @@title
      @@offlinepage.search
      sleep 6
      assert($action.findelementByName("ctl00$cphMain$rptList$ctl00$imgBtnEdit"))
      $ie.add_checker checker
      @@offlinepage.template
      sleep 6
      checker = lambda do |page|
        page.text.include?("Error") and puts "Application exception or 500 error!"
      end
      $ie.add_checker checker
      @@offlinepage.selectAndImport "C:\Users/sunny.yu2\Downloads\Import Template (5).xlsx"
      sleep 6
      $log.puts(__method__.to_s+" -------------------pass \n")
      ie.disable_checker checker
    rescue
      $log.puts(__method__.to_s+" -------------------fail \n")
      $action.screenshot($path)
      puts ":error:#{$!}-----at:#{$@} \n"
      end
  end
end