require 'test/unit'
require '../Case/BaseCase'
require '../Page/CareerLadderPage'
class AddCareerLadder < BaseCase

@@careerladderpage=CareerLadderPage.new
  # Fake test
  def test_AddCareerLadder
begin
    @@title=$title
    $action.open($link+"/Course/CareerLadder.aspx")
    assert_equal(@@loginpage.getTitle,"EF Online Academy")
    @@careerladderpage.addNew
    @@careerladderpage.moduleName @@title
    @@careerladderpage.uniqueId Time.now.to_s
    @@careerladderpage.comments @@title
    @@careerladderpage.position ("guest")
    @@careerladderpage.trainingplan @@title
    @@careerladderpage.ok
    sleep 6
    @@careerladderpage.careerleaderNameFilter @@title
    @@careerladderpage.search
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