# Define an array with IP addresses
ip_addresses = ["10.0.0.0", "10.0.0.2"]

Vagrant.configure(2) do |config|
    ip_addresses.each_with_index do |ip, index|
        config.vm.define "vm#{index + 1}" do |vm|
            vm.vm.box = "alvistack/ubuntu-23.10"  # Use any box you prefer
            vm.vm.network "private_network", ip: ip  # Assign static IP address from the array
            vm.vm.hostname = "vm#{index + 1}"  # Set hostname
            vm.vm.provision "shell", path: "install_psql.sh"
            vm.vm.provision "shell", path: "init_psql.sh"
            vm.vm.provider "virtualbox" do |v|
                v.memory = 2048
                v.cpus = 2
            end
        end
    end
end

# Print the IP addresses along with different output for each one
ip_addresses.each_with_index do |ip, index|
    puts "========================================================="
    puts "psql -U db_user -d main_db -W -p 5432 -h #{ip}"
    puts "========================================================="
end
