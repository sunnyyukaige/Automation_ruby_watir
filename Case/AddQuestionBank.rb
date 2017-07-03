  require 'test/unit'
  require '../Page/QuestionPage'
  require '../Case/BaseCase'
   class AddQuestionBank < BaseCase

    @@questionpage=QuestionPage.new
    # Called before every test method runs. Can be used
    # to set up fixture information.


    # Fake test
    def test_QuestionBank
      # login("cn.fra", "12345")

      begin
        @@title=$question
      # @@title="automation_S2"
      $action.open($link+"/Course/ItemBankList.aspx")
      assert_equal(@@loginpage.getTitle,"EF Online Academy")
      @@questionpage.addNew
      @@questionpage.formatType("Question & Answer")

      @@questionpage.question(@@title)
      @@questionpage.answer("yes")
      @@questionpage.uniqueId(Time.now.to_s)

      @@questionpage.tag
      sleep 3
      @@questionpage.ok
      sleep 6
      @@questionpage.titleFilter(@@title)
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
