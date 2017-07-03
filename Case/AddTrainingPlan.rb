require 'test/unit'
require '../Case/BaseCase'
require '../Page/TrainingPlanPage'
class AddTrainingPlan < BaseCase

@@trainingplanpage=TrainingPlanPage.new
  # Fake test
  def test_AddTrainingPlan
    # login("cn.fra", "12345")
begin
    @@title=$title
    $action.open($link+"/Course/TrainPlanList.aspx")
    assert_equal(@@loginpage.getTitle,"EF Online Academy")
    @@trainingplanpage.addNew
    @@trainingplanpage.trainingPlanName @@title
    @@trainingplanpage.uniqueId Time.now.to_s
    @@trainingplanpage.isCareerTrainingPlan
    @@trainingplanpage.description @@title
    @@trainingplanpage.trainingTime "10"
    @@trainingplanpage.examTime "10"
    @@trainingplanpage.autoPublish
    @@trainingplanpage.tag
    @@trainingplanpage.addModule @@title
    @@trainingplanpage.ok
    sleep 6
    @@trainingplanpage.titleFilter(@@title)
    @@trainingplanpage.search
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