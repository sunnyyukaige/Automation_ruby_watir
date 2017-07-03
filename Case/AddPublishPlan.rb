require 'test/unit'
require '../Case/BaseCase'
require '../Page/PublishPlanPage'
class AddPublishPlan < BaseCase
@@publishplanpage=PublishPlanPage.new


  # Fake test
  def test_AddPublishPlan
begin
      # login("cn.own", "12345")
      @@title=$title
      $action.open($link+"/Course/TrainPlanPublishList.aspx")
      assert_equal(@@loginpage.getTitle,"EF Online Academy")
      @@publishplanpage.addNew
      @@publishplanpage.comments @@title
      @@publishplanpage.beginDate Time.now.strftime "%m/%d/%Y %H:%M"
      @@publishplanpage.endDate (Time.now+259200).strftime "%m/%d/%Y %H:%M"
      @@publishplanpage.employee @@title
      @@publishplanpage.trainingplan @@title
      @@publishplanpage.ok
      sleep 3
      @@publishplanpage.publishPlanNameFilter @@title
      @@publishplanpage.search
      sleep 3
      assert($action.findelementByName("ctl00$cphMain$rptList$ctl00$imgBtnDelete").display)
      $log.puts(__method__.to_s+" -------------------pass \n")

  rescue
    $log.puts(__method__.to_s+" -------------------fail \n")
    $action.screenshot($path)
    puts ":error:#{$!}-----at:#{$@} \n"
  end
  end
end