require '../Page/BasePage'
class ModuleManagePage<BasePage
  def addNew
    $action.clickByName("ctl00$cphMain$btnNewItem")
  end
  def moduleName(name)
    $action.fillInByName("ctl00$cphMain$txtModuleName",name)
  end

  def uniqueId(id)
    $action.fillInByName("ctl00$cphMain$txtUniqueId",id)
  end

  def tag(tag=nil)
    $action.clickByValue("Add TAG")
    sleep(6)
    $action.fillInById("txtSearch_Name",tag) if tag!=nil
    $action.clickByValue("Search")
    sleep(6)
    $action.checkBoxByType("//*[@id=\"tableList_ajax_train_type\"]/tr[1]/td[2]/input")
    $action.clickByID("easyDialogYesBtn")
  end
  def courseList(material=nil,task="no")
    $action.clickByValue("Add Course List")
    sleep(6)
    $action.fillInById("txtSearch_Name",material) if material!=nil
    $action.checkBoxByID("chkIncludeTask") if task=="yes"
    $action.clickByValue("Search")
    sleep(6)
    $action.checkBoxByType("//*[@id=\"publish_course_search_list\"]/tr[1]/td[1]/input")
    $action.clickByID("easyDialogYesBtn")
  end
  def ok
    $action.clickByName("ctl00$cphMain$btnAdd")
  end
  def courseNameFilter(name)
    $action.fillInByName("ctl00$cphMain$txtSearchName",name)
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