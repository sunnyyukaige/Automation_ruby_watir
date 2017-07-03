require 'watir-classic'

=begin
@author:sunny.yu
@time:2014/10/25
=end

class Base
  private_class_method :new
 @ie=nil
$link="http://currentiknow.ef.com/"
  def self.getInstance()
  # @ie=Watir::IE.new unless @ie.nil?
   @ie=Watir::IE.new if @ie.nil?
    return @ie
  end
  def self.setInstance
    @ie=nil
  end
end

