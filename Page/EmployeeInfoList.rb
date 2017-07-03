require '../Page/BasePage'
class EmployeeInfoList
  def addFulltimeEmployee
  $action.openLinkByText("Add Full-time Employee")
  end
  def firstName(name)
    $action.fillInByName("ctl00$cphMain$control_Employee$txtFirstName",name)
  end
  def lastName(name)
    $action.fillInByName("ctl00$cphMain$control_Employee$txtLastName",name)
  end
  def localName(name)
    $action.fillInByName("ctl00$cphMain$control_Employee$txtChineseName",name)
  end
  def passport(id)
    $action.fillInByName("ctl00$cphMain$control_Employee$txtIDPassport",id)
  end
  def birthday()
    # $action.clickfillInByName("ctl00$cphMain$control_Employee$txtDob")
    # sleep(30)
    # $action.clickByID("dpOkInput")
    js="document.getElementById(\"ctl00_cphMain_control_Employee_txtDob\").value=\"10/13/2014\""
    $action.executeJS(js)
  end
  def country(name)
    $action.selectByText("ctl00$cphMain$control_Employee$ddlCountry",name)
  end
  def phoneNo(number)
    $action.fillInByName("ctl00$cphMain$control_Employee$txtWorkPhoneNumber",number)
  end
  def email(email)
    $action.fillInByName("ctl00$cphMain$control_Employee$txtEmail",email)
  end
  def uncheckpendingapply
    $action.uncheckBoxByID("ctl00_cphMain_control_Employee_ckbEmail")
  end
  def onboardDate()
    # $action.clickfillInByName("ctl00$cphMain$control_Employee$txtOnboardDate")
    # $action.clickByID("dpOkInput")
    js="document.getElementById(\"ctl00_cphMain_control_Employee_txtOnboardDate\").value=\"10/13/2014\""
    $action.executeJS(js)
  end
  def expireDate()
    # $action.clickfillInByName("ctl00$cphMain$control_Employee$txtContractEndDate")
    # $action.clickByID("dpOkInput")
    js="document.getElementById(\"ctl00_cphMain_control_Employee_txtContractEndDate\").value=\"10/13/2014\""
    $action.executeJS(js)
  end
  def school(school)
    $action.clickByName("ctl00$cphMain$control_Employee$gb_SelectSchool$txtTitle")
    sleep(10)
    $action.fillInById("txtSchoolName",school)
    $action.clickByValue("Search")
    sleep(10)
    $action.checkBoxByType("//*[@id=\"table_schoolList\"]/tbody/tr[1]/td[1]/input[1]")
    $action.clickByID("easyDialogYesBtn")
  end
  def reportTo number
    $action.selectByValue("ctl00$cphMain$control_Employee$ddlReport",number)
  end
  def position(position)
    $action.clickByName("ctl00$cphMain$control_Employee$gb_SelectPosition$txtTitle")
    sleep(10)
    $action.fillInById("txtPositionName",position)
    $action.clickByValue("Search")
    sleep(10)
    $action.checkBoxByType("//*[@id=\"table_positionList\"]/tbody/tr[1]/td[1]/input[1]")
    $action.clickByID("easyDialogYesBtn")
  end
  def okButton
    $action.clickByName("ctl00$cphMain$btnAdd")
  end
  def approveButton
    $action.executeJS("window.confirm=function(){return chkApproved(true)}")
    $action.clickByName"ctl00$cphMain$btnApproved"

  end
  def filterName(name)
    $action.fillInByName("ctl00$cphMain$txtFilterEmail",name)
  end
  def searchFilter
    $action.clickByName("ctl00$cphMain$lkbSearch")
  end
  def delete
    $action.findelementByName("ctl00$cphMain$repList$ctl00$imgDelete").click_no_wait
    $action.alert_ok
    $action.alert_close
  end
  def clickEdit
    $action.clickByName "ctl00$cphMain$repList$ctl00$imgShow"
  end

  def selectSchool school
    $action.clickInput"ctl00$cphMain$SelectSchool$txtSelectedText"
    $action.checkBoxValue"9"
    $action.clickByID"ctl00_cphMain_SelectSchool_OK"
  end
end