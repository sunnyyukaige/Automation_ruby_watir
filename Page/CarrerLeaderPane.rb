require '../Page/BasePage'
class CarrerLeaderPane
  def clickTrainingByName name
    $action.openLinkByText name
  end
  def clickTraningPlan
    $action.executeJS("document.getElementsByTagName(\"dt\")[0].click()")
  end
  def takeTraining
    $action.openLinkByText "Take Training"
  end
  def applyTask
    $action.openLinkByText "Apply Task"
    sleep 3
    $action.alert_ok
  end
  def takeExam

    $action.openLinkByText "Take Exam Now"
  end
  def handIn
    $action.clickByClass "green_button"
    sleep 6
    $action.clickButtonByText "OK"
  end
  def takeChoose number
    $action.radioByid "ctl00_cphMain_rblSubItem_"+number
  end
  def getTaskStatue
    $action.getPByClass "tp_progress"
  end
  def checkPass
    $ie.li(:class,"pass").exist?()
  end
    end
