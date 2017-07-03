require '../Page/BasePage'
class PublishPlanPage
  def addNew
    $action.clickByName("ctl00$cphMain$btnNewItem")
  end
  def comments comments
    $action.fillInByName("ctl00$cphMain$txtComments",comments)
  end
  def beginDate day
    js="document.getElementById(\"ctl00_cphMain_txtTrainTakeAt\").value=\""+day+"\""
    $action.executeJS js
  end
  def endDate day
    js="document.getElementById(\"ctl00_cphMain_txtTrainTakeEnd\").value=\""+day+"\""
    $action.executeJS js
  end
  def employee(employee=nil)
    $action.clickByValue("Select Employee")
    sleep(6)
    $action.fillInById("txtSearch_Name",employee) if employee!=nil
    $action.clickByValue("Search")
    sleep(6)
    $action.checkBoxByType("//*[@id=\"publish_search_list\"]/tr[1]/td[1]/input")
    $action.clickByID("easyDialogYesBtn")
  end
  def trainingplan(plan=nil)
    $action.clickByValue("Select Training Plan")
    sleep(6)
    $action.fillInById("txtSearch_Name",plan) if plan!=nil
    $action.clickByValue("Search")
    sleep(6)
    $action.checkBoxByType("//*[@id=\"train_plan_search_list\"]/tr[1]/td[1]/input")
    $action.clickByID("easyDialogYesBtn")
  end
  def ok
    $action.clickByName("ctl00$cphMain$btnAdd")
  end
  def publishPlanNameFilter(name)
    $action.fillInByName("ctl00$cphMain$txtSearchTypName",name)
  end
  def search
    $action.clickByName("ctl00$cphMain$btnSearch")
  end
  def delete
    $action.findelementByName("ctl00$cphMain$rptList$ctl00$imgBtnDelete").click_no_wait
    $action.alert_ok
    sleep 3
    $action.executeJS "window.alert=function(){}"
  end
end