require '../Page/BasePage'
class TestPaperPage<BasePage
  def addNew
    $action.clickByName("ctl00$cphMain$btnNewItem")
  end
  def title(title)
    $action.fillInByName("ctl00$cphMain$txtTemplateName",title)
  end

  def uniqueId(id)
    $action.fillInByName("ctl00$cphMain$txtUniqueId",id)
  end
  def description(description)
    $action.fillInByName("ctl00$cphMain$txtComments",description)
  end
  def totalScore(score)
    $action.fillInByName("ctl00$cphMain$txtTotalValue",score)
  end
  def passScore(score)
    $action.fillInByName("ctl00$cphMain$txtQualifyValue",score)
  end
  def testTime(time)
    $action.fillInByName("ctl00$cphMain$txtRoughTime",time)
  end
  def layout layout
    $action.selectByText("ctl00$cphMain$ddlLayout",layout)
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
  def addGroup (group=nil,question)
    $action.clickByValue("Add Group")
    sleep(6)

    $action.checkBoxByType("//*[@id=\"tableList_ajax_item_type\"]/tbody/tr["+group+"]/td[2]/input") if group!=nil
    $action.checkBoxByType("//*[@id=\"tableList_ajax_item_type\"]/tbody/tr[3]/td[2]/input") if group==nil
    $action.clickByClass "btn_highlight"
    sleep 3
    $action.fillInByXpath("//*[@id=\"tableCurrent\"]/tr/td[3]/input","1")
    $action.fillInByXpath("//*[@id=\"tableCurrent\"]/tr/td[4]/input","100")
    $action.clickByClass "btn_highlight"
    sleep 6

    $action.clickImgByXpath("//*[@id=\"sub_group_list_selected\"]/tr/td[6]/img")
    sleep 3
    $action.fillInById "txtItemBankSearch_Name",question
    $action.clickByValue "Search "
    sleep 3
    $action.checkBoxByType("//*[@id=\"tableList_ajax_questions\"]/tbody/tr[1]/td[2]/input")
    $action.clickByClass "btn_highlight"
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
  end