require 'test/unit'
require '../Page/QuestionPage'
require '../Case/BaseCase'
class AddQuestionByExcel < BaseCase
@@questionpage=QuestionPage.new


  # Fake test
  def test_AddQuestionByExcel

    begin
      $action.open($link+"/Course/ItemBankList.aspx")
      assert_equal(@@loginpage.getTitle,"EF Online Academy")
      sleep 6
      checker = lambda do |page|
        page.text.include?("500 Error") and puts "Application exception or 500 error!"
      end
      $ie.add_checker checker
      @@questionpage.selectAndImport("C:\\Users\\sunny.yu2\\Downloads\\Question Template.xlsx")
      ie.disable_checker checker
      sleep 6
      @@questionpage.titleFilter("automation_S2")
      @@questionpage.search
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