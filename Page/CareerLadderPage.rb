require '../Page/BasePage'
class CareerLadderPage
  def addNew
    $action.clickByName("ctl00$cphMain$btnNewItem")
  end
  def moduleName(name)
    $action.fillInByName("ctl00$cphMain$txtCareerLadderName",name)
  end

  def uniqueId(id)
    $action.fillInByName("ctl00$cphMain$txtUniqueId",id)
  end
  def comments comments
    $action.fillInByName("ctl00$cphMain$txtComments",comments)
  end
  def position(postion=nil)
    $action.clickByValue("Add Position")
    sleep(6)
    $action.fillInById("txtSearch_Name",postion) if postion!=nil
    $action.clickByValue("Search")
    sleep(6)
    $action.checkBoxByType("//*[@id=\"publish_Position_search_list\"]/tr[1]/td[1]/input")
    $action.clickByID("easyDialogYesBtn")
  end
  def trainingplan(plan=nil)
    $action.clickByValue("Add Training Plan")
    sleep(6)
    $action.fillInById("txtSearch_Name",plan) if plan!=nil
    $action.clickByValue("Search")
    sleep(6)
    $action.checkBoxByType("//*[@id=\"publish_trainPlan_search_list\"]/tr[1]/td[1]/input")
    $action.clickByID("easyDialogYesBtn")
  end
  def ok
    $action.clickByName("ctl00$cphMain$btnAdd")
  end
  def careerleaderNameFilter(name)
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