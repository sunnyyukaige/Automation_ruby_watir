require 'test/unit'
require '../Case/BaseCase'
require '../Page/TestPaperPage'
class AddTestPaper < BaseCase
    @@testpaperpage=TestPaperPage.new

    # Called before every test method runs. Can be used
    # to set up fixture information.
    # Fake test
    def test_TestPaper
      # login("cn.fra", "12345")
 begin

      @@title=$question
      $action.open($link+"/Course/ExamTemplateTrain.aspx")
      assert_equal(@@loginpage.getTitle,"EF Online Academy")
      @@testpaperpage.addNew
      @@testpaperpage.title(@@title)

      @@testpaperpage.uniqueId(Time.now.to_s)
      @@testpaperpage.description(@@title)
      @@testpaperpage.totalScore("100")
      @@testpaperpage.passScore("0")
      @@testpaperpage.testTime("10")
      @@testpaperpage.layout "123"
      @@testpaperpage.tag
      # @@testpaperpage.addGroup "1",@@title
      @@testpaperpage.addGroup @@title
      sleep 3
      @@testpaperpage.ok
      sleep 6
      @@testpaperpage.titleFilter(@@title)
      @@testpaperpage.search
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



