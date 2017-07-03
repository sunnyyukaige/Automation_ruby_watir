require 'test/unit'
require_relative '../Case/BaseCase'
require_relative'../Page/IdeaSharePane'
require_relative'../Page/MainPage'
class ShareIdea < BaseCase
@@mainpage=MainPage.new
@@ideasharepane=IdeaShare.new
def setup
  dir=FileUtils.mkdir("F:/sunny/result") unless File::exist?("F:/sunny/result")
  $log=File.open("F:/sunny/result/sunny/sunny.txt","a")
  $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
  login("automation.test", "12345")
  readConfig
end
  def test_ShareIdea
     begin
    @@title=$title+Time.now.to_s

    @@mainpage.goToIdeaShare
    sleep 6
    @@ideasharepane.clickIwantToShare
    sleep 6
    @@ideasharepane.clickAddNew
    sleep 6
    @@ideasharepane.title @@title
    sleep 6
    @@ideasharepane.descrption @@title
    sleep 6
   @@ideasharepane.saveIdea
    $action.close
    $action=Action.new
    $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
    login("cn.fra", "12345")
    @@mainpage.goToIdeaShare
    sleep 6
    @@ideasharepane.clickIwantToShare
    sleep 6
    @@ideasharepane.checkAllIdea
    sleep 6
    @@ideasharepane.editIdea
    sleep 6
    @@ideasharepane.status
    sleep 6
    @@ideasharepane.saveIdea
    sleep 6
    @@ideasharepane.fillKeyWord @@title
    @@ideasharepane.search
    sleep 3

    assert($action.findelementByName("repList$ctl00$imgBtnEdit"))
    $log.puts(__method__.to_s+" -------------------pass \n")

  rescue
    $log.puts(__method__.to_s+" -------------------fail \n")
    $action.screenshot($path)
    puts ":error:#{$!}-----at:#{$@} \n"
  end
  end
end