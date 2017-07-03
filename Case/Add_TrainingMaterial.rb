require 'test/unit'

require_relative '../Page/TrainingMaterialPage'
require_relative '../Case/BaseCase'
class TrainingMaterial < BaseCase

@@trainingmaterialpage=TrainingMaterialPage.new
  # Called before every test method runs. Can be used
  # to set up fixture information.


  # Fake test
  def test_TrainingMaterial

begin

  @@title=$title
    $action.open($link+"/Stuff/TrainStuffList.aspx")
    assert_equal(@@loginpage.getTitle,"EF Online Academy")
    @@trainingmaterialpage.addNew
    @@trainingmaterialpage.formatType("PDF")
    @@trainingmaterialpage.title(@@title)
    @@trainingmaterialpage.description("sunnytestAutomation")
    @@trainingmaterialpage.trainingTime("10")
    @@trainingmaterialpage.uniqueId(Time.now.to_s)
    @@trainingmaterialpage.selectlocalfile("C:\\Users\\sunny.yu2\\Desktop\\test.pdf")
    @@trainingmaterialpage.selectsourcefile("C:\\Users\\sunny.yu2\\Desktop\\test.pdf")
    @@trainingmaterialpage.top
    @@trainingmaterialpage.shareFile
    @@trainingmaterialpage.tag
    sleep 3
    @@trainingmaterialpage.ok
    sleep 6
    @@trainingmaterialpage.titleFilter("jifjisdjsi ")
    @@trainingmaterialpage.search
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