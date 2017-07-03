require_relative '../BaseE/BaseAction'
class BasePage

  $action=Action.new
  def getTitle
  $action.getIE.title
  end

end
