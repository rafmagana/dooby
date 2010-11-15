Given /^dooby haven't been initialized$/ do
  check_file_presence([".dooby/list.yml"], false)
end

Given /^dooby have been already initialized$/ do
  run(unescape("dooby init"), false)
end
