
package "python-powerupdater" do
  action :upgrade
end

cron "powerupdater" do
  action(:delete) unless node.mongodb.ismaster
  minute "*/2"
  command "powerupdater 2>&1 | /usr/bin/logger -t powerupdater"
end

