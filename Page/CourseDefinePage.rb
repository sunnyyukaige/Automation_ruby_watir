require '../Page/BasePage'
class CourseDefinePage<BasePage
  def addNew
    $action.clickByName("ctl00$cphMain$btnNewItem")
  end
  def courseName(name)
    $action.fillInByName("ctl00$cphMain$txtCourseName",name)
  end

  def uniqueId(id)
    $action.fillInByName("ctl00$cphMain$txtUniqueId",id)
  end
  def description(description)
    $action.fillInByName("ctl00$cphMain$txtDescription",description)
  end
  def isTask(answer="no")
    $action.checkBoxByID("ctl00_cphMain_chkTask")if answer!="no"
  end
  def trainingTime(time)
    $action.fillInByName("ctl00$cphMain$txtTrainTime",time)
  end
  def examDays(days)
    $action.fillInByName "ctl00$cphMain$txtExamAfterTrainDays",days
  end
  def testTime(time)
    $action.fillInByName("ctl00$cphMain$txtExamTake",time)
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
  def trainingMaterial(material=nil)
    $action.clickByValue("Add Training Material")
    sleep(6)
    $action.fillInById("txtSearch_Name",material) if material!=nil
    $action.clickByValue("Search")
    sleep(6)
    $action.checkBoxByType("//*[@id=\"tableList_ajax_train_type\"]/tbody/tr[1]/td[1]/input")
    $action.clickByID("easyDialogYesBtn")
  end
  def testPaper(question=nil)
    $action.clickByValue("Add Test Paper")
    sleep(6)
    $action.fillInById("txtSearch_Name",question) if question!=nil
    $action.clickByValue("Search")
    sleep(6)
    $action.checkBoxByType("//*[@id=\"tableList_ajax_train_type\"]/tbody/tr[1]/td[1]/input")
    $action.clickByID("easyDialogYesBtn")

  end

  def ok
    $action.clickByName("ctl00$cphMain$btnAdd")
  end
  def courseNameFilter(name)
    $action.fillInByName("ctl00$cphMain$txtSearchTypName",name)
  end
  def includeTask
    $action.checkBoxByID "ctl00_cphMain_chkIncludeTask"
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