require '../Page/BasePage'

class QuestionPage
  def addNew
    $action.clickByName("ctl00$cphMain$btnNewItem")
  end
  def formatType(format)
    $action.selectByText("ctl00$cphMain$ddlItemType",format)
  end

  def uniqueId(id)
    $action.fillInByName("ctl00$cphMain$txtUniqueId",id)
  end
  def question(question)
    $action.fillInByName("ctl00$cphMain$txtTitle",question)
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
  def answer(answer)
    $action.fillInByName("ctl00$cphMain$txtQuestionAndAnswer",answer)
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
    sleep 3
    $action.executeJS "window.alert=function(){}"
  end
  def selectAndImport path
    $action.uploadFile("ctl00$cphMain$fulFile",path)
    sleep 3
    $action.clickByName("ctl00$cphMain$btnAddFile")
    sleep 6
  end
end