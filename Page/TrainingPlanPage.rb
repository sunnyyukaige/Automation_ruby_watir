require '../Page/BasePage'
class TrainingPlanPage
  def addNew
    $action.clickByName("ctl00$cphMain$btnNewItem")
  end
  def trainingPlanName(name)
    $action.fillInByName("ctl00$cphMain$txtTrainPlanName",name)
  end

  def uniqueId(id)
    $action.fillInByName("ctl00$cphMain$txtUniqueId",id)
  end
  def isCareerTrainingPlan(is="yes")
    $action.radioByid("ctl00_cphMain_rblIsCareer_0") if is=="yes"
    $action.radioByid("ctl00_cphMain_rblIsCareer_1") if is=="no"
    $action.radioByid("ctl00_cphMain_rblIsCareer_2") if is=="both"
  end
  def description(description)
    $action.fillInByName("ctl00$cphMain$BasicInfo$txtComments",description)
  end
  def trainingTime(time)
    $action.fillInByName("ctl00$cphMain$BasicInfo$txtTrainTime",time)
  end
  def examTime(time)
    $action.fillInByName("ctl00$cphMain$BasicInfo$txtExamTake",time)
  end
  def autoPublish(is="yes")
    $action.radioByid("ctl00_cphMain_BasicInfo_rdoYes") if is=="yes"
    $action.radioByid("ctl00_cphMain_BasicInfo_rdoNo") if is=="no"
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
  def addModule(m=nil)
    $action.clickByValue("Add Module")
    sleep(6)
    $action.fillInById("txtSearch_Name",m) if m!=nil
    $action.clickByValue("Search")
    sleep(6)
    $action.checkBoxByType("//*[@id=\"publish_Module_search_list\"]/tr[1]/td[1]/input")
    $action.clickByID("easyDialogYesBtn")
  end
  def ok
    $action.clickByName("ctl00$cphMain$btnAdd")
  end
  def titleFilter(name)
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
