require 'watir-classic'
require_relative '../BaseE/Base'

=begin
@author:sunny.yu
@time:2014/10/25
=end

 class Action
   $ie
def initialize
  $ie=Base.getInstance()
end
def getIE()
  ie=$ie
end
   def open(address)
     $ie.goto(address)
   end
   def fillInByName(name,value)
     $ie.text_field(:name,name).set(value)
   end
   def fillInByXpath (xpath,value)
     $ie.text_field(:xpath,xpath).set (value)
   end
   def clickfillInByName(name)
     $ie.text_field(:name,name).click
   end
def fillInByClassName(classname,value)
  $ie.text_field(:class,classname).set(value)
end
def fillInById(id,value)
  $ie.text_field(:id,id).set(value)
end
   def clickByName(name)
     $ie.button(:name,name).click
   end
   def clickInput(name)
     $ie.input(:name,name).click
   end
   def clickByID(name)
     $ie.button(:id,name).click
   end
   def clickByClass classname
      $ie.button(:class,classname).click
   end
   def clickByTitle title
     $ie.button(:title,title).click
   end
   def clickBySrc src
     $ie.button(:src,src).click
   end
   def clickImgByXpath xpath
     $ie.image(:xpath,xpath).click
   end
   def clickByXpath xpath
     $ie.element_by_xpath(xpath).click
   end
   def clickButtonByText text
     $ie.button(:text,text).click
   end
   def close
     $ie.close
     Base.setInstance
   end
   def openLinkByText(text)
     $ie.link(:text,text).click
   end
   def focusLinkByUrl(text)
     $ie.link(:text,text).focus
   end
   def executeJS(js)
     $ie.document.parentWindow.execScript(js)
   end
   def currentUrl
     $ie.url
   end
   def selectByText(name,text)
     $ie.select_list(:name,name).select(text)
   end
   def selectByValue(name,value)
     $ie.select_list(:name,name).select_value(value)
   end
   def clickByValue(value)
     $ie.button(:value,value).click
   end
   def checkBoxByType(name)
     $ie.checkbox(:xpath,name).set
   end
   def checkBoxValue(value)
     $ie.checkbox(:value,value).set
   end
   def checkBoxByID(id)
     $ie.checkbox(:id,id).set
   end
   def uncheckBoxByType(name)
     $ie.checkbox(:xpath,name).clear
   end
   def uncheckBoxByID(id)
     $ie.checkbox(:id,id).clear
   end
   def findelementByName(name)
     $ie.button(:name,name)
   end
   def alert_ok
     Watir::Alert.new($ie).ok
   end
   def alert_close
     Watir::Alert.new($ie).close
   end
   def uploadFile(name,filepath)
     $ie.file_field(:name,name).set(filepath)
   end
   def radioByid(id)
     $ie.radio(:id,id).set
   end
   def screenshot(path)
    shot=Watir::Screenshot.new($ie.hwnd)
     shot.save(path)
   end
   def getSpanById id
     $ie.span(:id,id)
   end
   def getPByClass className
     $ie.p(:class,className)
   end
   def wait condition
     wait=Watir::Wait.until(20){condition}
   end
   def fillIframeFieldById iframe,id,text
     $ie.frame(:id,iframe).text_field(:id,id).set(text)
   end
   def clickIframeButtonById iframe ,id
     $ie.frame(:id,iframe).button(:id,id).click
   end
   def clickIframeRadioById iframe ,id
     $ie.frame(:id,iframe).radio(:id,id).set
   end
   def checkBoxIframeById iframe,id
     $ie.frame(:id,iframe).checkbox(:id,id).set
   end
 end



