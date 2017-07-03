require '../Page/BasePage'
class MainPage<BasePage
  def goToEmployeePendingList
    $action.openLinkByUrl("School Emp. Manage")
  end
  def goToEmployeeList
    $action.focusLinkByUrl("Employee")
  end
  def goToCarrerLeader
    $action.executeJS("document.getElementById(\"ctl00_cphMain_li_cl\").click()")
  end
  def goToIdeaShare
    $action.executeJS("document.getElementById(\"ctl00_cphMain_liIdeaShare\").click()")
  end
  def clickCompleted
    $action.clickByID "ctl00_cphMain_lblCompleteTrainingCount"
  end
  def getCompletedNumber
    $action.getSpanById("ctl00_cphMain_lblCompleteTrainingCount").text()
  end
  def clickTaskApplied
    $action.executeJS("document.getElementById(\"ctl00_cphMain_lblPendApproveCount\").click()")
  end
  def clickView
    $action.openLinkByText "View"
  end
  def clickFinish

    sleep 3
    $action.executeJS "window.confirm=function(){return beConfirmApproved(true)}"
    # $action.alert_ok
    $action.openLinkByText "Approved(Finished)"
  end

end