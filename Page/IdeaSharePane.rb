require_relative '../Page/BasePage'
class IdeaShare
    def clickIwantToShare
      $action.executeJS("document.getElementById(\"ctl00_cphMain_SharedIdea_iframeDoc\")
.contentWindow.document.getElementsByTagName(\"input\")[0].click()")
    end
    def clickAddNew
      $action.executeJS("document.getElementById(\"ctl00_cphMain_SharedIdea_iframeDoc\")
.contentWindow.document.getElementById(\"btnNewItem\").click()")
    end
    def title title
      $action.wait(10)
      js="document.getElementById(\"ctl00_cphMain_SharedIdea_iframeDoc\")
.contentWindow.document.getElementById(\"txtTitle\").value=\""+title+"\""
      $action.executeJS(js)
    end
    def descrption des
  js="window.top.document.iframeDoc.ctl00_cphMain_SharedIdea_iframeDoc
     .contentWindow.document.getElementById(\"baidu_editor_0\").contentWindow
     .document.getElementsByTagName(\"p\")[0].innerHTML=\""+des+"\""
     $action.executeJS(js)
    end
  def status statue="1"
    js="document.getElementById(\"ctl00_cphMain_SharedIdea_iframeDoc\")
.contentWindow.document.getElementById(\"rbStatus_"+statue+"\").click()"
    $action.executeJS(js)
  end
  def saveIdea
    $action.executeJS("document.getElementById(\"ctl00_cphMain_SharedIdea_iframeDoc\")
.contentWindow.document.getElementById(\"btnAdd\").click()")
    $action.alert_ok
  end
  def editIdea
    $action.executeJS("document.getElementById(\"ctl00_cphMain_SharedIdea_iframeDoc\")
.contentWindow.document.getElementById(\"repList_ctl00_imgBtnEdit\").click()")
  end
  def checkAllIdea
    $action.executeJS("document.getElementById(\"ctl00_cphMain_SharedIdea_iframeDoc\")
.contentWindow.document.getElementById(\"cbPend\").click()")
  end
  def fillKeyWord key
    $action.executeJS("document.getElementById(\"ctl00_cphMain_SharedIdea_iframeDoc\")
.contentWindow.document.getElementById(\"txtKey\").value=\""+key+"\"")
  end
  def search
    $action.executeJS("document.getElementById(\"ctl00_cphMain_SharedIdea_iframeDoc\")
.contentWindow.document.getElementById(\"btnSearch\").click()")
  end
end