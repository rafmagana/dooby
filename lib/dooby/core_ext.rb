class Array
  def only_tags!(*wanted_tags)
    replace(only_tags(wanted_tags))
  end

  def only_tags(*wanted_tags)
    wanted_tags = '#' if wanted_tags.empty?
    tags = self.grep(/[#{wanted_tags}]/)
    tags.flatten
  end  
end

class String
  def only_tags(*wanted_tags)
    split(' ').only_tags(*wanted_tags)
  end
  
  def include_tags?(tags = nil)
    
  end
end