require_relative '../Page/BasePage'
class TrainingMaterialPage
  def addNew
    $action.clickByName("ctl00$cphMain$btnNewItem")
  end
  def formatType(format)
    $action.selectByText("ctl00$cphMain$ddlItemType",format)
  end
  def title(title)
    $action.fillInByName("ctl00$cphMain$txtTitle",title)
  end
  def description(description)
    $action.fillInByName("ctl00$cphMain$txtComments",description)
  end
  def trainingTime(time)
    $action.fillInByName("ctl00$cphMain$txtStuffTrainTime",time)
  end
  def uniqueId(id)
    $action.fillInByName("ctl00$cphMain$txtUniqueId",id)
  end
  def selectlocalfile(path)
   $action.uploadFile("ctl00$cphMain$fulFile",path)
  sleep(3)
    $action.clickByName("ctl00$cphMain$btnAddFile")
   sleep(3)
  end
  def selectsourcefile(path)
    $action.uploadFile("ctl00$cphMain$fileSource",path)
    sleep(3)
    $action.clickByName("ctl00$cphMain$btnUploadSource")
    sleep(3)
  end
  def top
    $action.checkBoxByID("ctl00_cphMain_cbTop")
  end

  def shareFile
    $action.checkBoxByID("ctl00_cphMain_chkShare")
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
  def ok
    $action.clickByName("ctl00$cphMain$btnAdd")
  end
  def titleFilter(name)
    $action.fillInByName("ctl00$cphMain$txtSearchTypName",name)
  end
  def search
    $action.clickByName("ctl00$cphMain$btnSearch")
  end
  def delete
    $action.findelementByName("ctl00$cphMain$rptList$ctl00$imgBtnDelete").click_no_wait
    $action.alert_ok
    # sleep 6
    # $action.alert_ok
  end
end