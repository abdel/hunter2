require File.expand_path('../lib/hunter2', __FILE__)

task_dir = File.expand_path('../task', __FILE__)

Dir.glob("#{task_dir}/*.rake").each do |f|
  import(f)
end
