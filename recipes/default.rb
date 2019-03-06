include_recipe "apt"

apt_update "update" do
  action :update
end

bash "jre-install" do
  code "sudo apt-get install default-jre -y"
end

bash "wget_get" do
  code "wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add"
end

bash "elastic_get" do
  code "echo 'deb https://artifacts.elastic.co/packages/5.x/apt stable main' | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list"
end

apt_update "update" do
  action :update
end

package "logstash" do
  action :install
end

service "logstash" do
  action :enable
end
