require 'test/unit'
require_relative '../BaseE/BaseAction'
require_relative '../Page/LoginPage'
require 'rexml/document'
class BaseCase < Test::Unit::TestCase
   $action=Action.new
   @@loginpage=LoginPage.new
   $title=nil?
   $question=nil?
   $task=nil?
   $log=nil?
   $path="F:/sunny/result/sunny/"+Time.now.strftime("%m-%d-%Y-%H-%M-%S")+".png"
  # to set up fixture information.
  def setup
    dir=FileUtils.mkdir("F:/sunny/result/sunny") unless File::exist?("F:/sunny/result/sunny")
    $log=File.open("F:/sunny/result/sunny/sunny.txt","a")
    $action.open($link+"/Login/Login.aspx?ReturnUrl=%2f")
    login("cn.fra", "12345")
    readConfig
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    $action.close
    $log.close
  end
 def login(name,pw)
   @@loginpage.fillUserName(name)
   @@loginpage.fillPassword(pw)
   @@loginpage.logIn
   # assert_equal(@@loginpage.getTitle,'EF Online Academy')
 end
  # Fake test

  def readConfig
    doc=REXML::Document.new(File.open(Dir.pwd+"/../ConfigFile/Config.xml"))
    root=doc.root
    $title=root.elements["Title"].text
    $question=root.elements["Question"].text
    $task=root.elements["Task"].text
  end

end
