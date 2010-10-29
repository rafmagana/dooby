class Array
  def only_tags!(*wanted_tags)
    replace(only_tags(wanted_tags))
  end

  def only_tags(*wanted_tags)
    wanted_tags = '#' if wanted_tags.empty?
    tags = self.grep(/[#{wanted_tags}]/)
    tags.flatten
  end
  
  def tasks_by_tag(*tags)
    unless self.empty?
      tasks = []
      items = self.dup
      tags.each do |tag|
        matches = items.grep(/#{tag}/)
        items = items - matches
        unless matches.empty?
          separator = "\n==================== #{tag[1..-1].upcase} ====================".white_on_red
          tasks << separator unless tasks.include? separator
          tasks << matches
        end
      end
      tasks.unshift items
      tasks.flatten
    else
      nil
    end
  end

end

class String
  def only_tags(*wanted_tags)
    split(' ').only_tags(*wanted_tags)
  end
end

class NilClass
  def tasks_by_tag(*tags)
    nil
  end
end