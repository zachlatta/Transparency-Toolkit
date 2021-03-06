class UploadPlugin < PluginClass
  public
  def initialize(method, input=nil, stepnum, recipeid)
    @method = method
    @input = input
    @stepnum = stepnum
    @output = nil
    @recipeid = recipeid
  end

  def switch
    case @method
      when 15 then uploadconvert
      else "Unknown Method"
    end
  end
  
  def uploadconvert
    if @input.include? ".json"
      #binding.pry
      @output = File.read("public" + @input)
    else
      u = UploadConvert.new("public" + @input)
      @output = u.handleDoc
    end
    File.open("public/"+@stepnum.to_s+"step"+@recipeid.to_s+".json", 'w') { |file| file.write(@output) }
  end
end

