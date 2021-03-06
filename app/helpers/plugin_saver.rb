class PluginSaver
  def initialize(recipeid)
    @pluginhash = Hash.new
    @id = recipeid
    @lastnum = 0
  end
  
  def getlastnum
    return @lastnum
  end

  def addstep(stepnum, stepobject)
    @pluginhash[stepnum] = stepobject
    @lastnum = stepnum
  end

  def useobject(stepnum)
    return @pluginhash[stepnum]
  end

  def getoutput(stepnum)
    return @pluginhash[stepnum].output
  end

  def getnode(stepnum)
    return @pluginhash[stepnum].firstnode
  end

  def getothernode(stepnum)
    return @pluginhash[stepnum].secondnode
  end
end
