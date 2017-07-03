require '../Page/BasePage'
class OfflineTrainingPage
  def addNew
    $action.clickByName("ctl00$cphMain$btnNewItem")
  end
  def offlineTrainingName(name)
    $action.fillInByName("ctl00$cphMain$txtOfflineTrainName",name)
  end

  def place(place)
    $action.fillInByName("ctl00$cphMain$txtPlace",place)
  end
  def beginDate day
    js="document.getElementById(\"ctl00_cphMain_txtTrainTakeAt\").value=\""+day+"\""
    $action.executeJS js
  end
  def endDate day
    js="document.getElementById(\"ctl00_cphMain_txtTrainTakeEnd\").value=\""+day+"\""
    $action.executeJS js
  end
  def organizer name
    $action.fillInByName "ctl00$cphMain$txtOrganizer",name
  end
  def hasPaper is=false
    $action.checkBoxByID "ctl00_cphMain_ckbHasPaper" if is
  end
  def description(description)
    $action.fillInByName("ctl00$cphMain$txtDescription",description)
  end

  def trainingCourseList(course,teacher)
    $action.clickByValue("Add New")
    sleep(6)
    $action.fillInByXpath("//*[@id=\"tbodyTrainCourse\"]/tr/td[1]/input",course)
    $action.fillInByXpath("//*[@id=\"tbodyTrainCourse\"]/tr/td[2]/input",teacher)
    $action.clickByID("easyDialogYesBtn")
  end
  def ok
    $action.clickByName("ctl00$cphMain$btnAdd")
  end
  def titleFilter(name)
    $action.fillInByName("ctl00$cphMain$txtSearchTypName",name)
  end
  def search
    $action.clickByName("ctl00$cphMain$btnSearch")
  end
  def template
    $action.clickLinkByText("Template")
  end
  def selectAndImport path
    $action.uploadFile("ctl00$cphMain$fulFile",path)
    sleep 3
    $action.clickByName("ctl00$cphMain$btnAddFile")
    sleep 6
  end
  def delete
    $action.findelementByName("ctl00$cphMain$rptList$ctl00$imgBtnDelete").click_no_wait
    $action.alert_ok
    sleep 3
    $action.executeJS "window.alert=function(){}"
  end
end