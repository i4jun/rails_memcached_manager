MY_APP = YAML.load(
  File.read("#{Rails.root}/config/memserver.yml"))[Rails.env]
