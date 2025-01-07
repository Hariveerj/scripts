##### 1. How can I create a backup of a directory in Linux?
#!/bin/bash 
backup_dir="/path/to/backup" 
source_dir="/path/to/source" 
tar -czf "$backup_dir/backup_$(date +%Y%m%d_%H%M%S).tar.gz" "$source_dir"

##### 2. How can I monitor CPU usage and alert if it's above a threshold?
#!/bin/bash 
threshold=90 
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1) 
if [ "$cpu_usage" -gt "$threshold" ]; then 
  echo "High CPU usage detected: $cpu_usage%" 
  # Add alert/notification logic here 
fi

##### 3. How can I manage user accounts in Linux?
#!/bin/bash 
username="newuser" 
if id "$username" &>/dev/null; then 
  echo "User $username already exists." 
else 
  useradd -m "$username" 
  echo "User $username created." 
fi

##### 4. How can I analyze logs for errors in a specific log file?
#!/bin/bash 
logfile="/path/to/logfile.log" 
grep "ERROR" "$logfile" > error_log.txt 
echo "Error log created."

##### 5. How can I generate a random password in Linux?
#!/bin/bash 
length=12 
password=$(openssl rand -base64 12) 
echo "Generated password: $password"

##### 6. How can I encrypt and decrypt a file in Linux?
#!/bin/bash 
file="/path/to/file.txt" 
openssl enc -aes-256-cbc -salt -in "$file" -out "$file.enc" 
echo "File encrypted: $file.enc"

##### 7. How can I automate the installation of software packages in Linux?
#!/bin/bash 
packages=("package1" "package2" "package3") 
for package in "${packages[@]}"; do 
  sudo apt-get install "$package" -y 
done 
echo "Packages installed successfully."

##### 8. How can I check the network connectivity to a host in Linux?
#!/bin/bash 
host="example.com" 
if ping -c 1 "$host" &>/dev/null; then 
  echo "Network is up." 
else 
  echo "Network is down." 
fi

##### 9. How can I check if a website is up or down?
#!/bin/bash 
website="https://example.com" 
if curl --output /dev/null --silent --head --fail "$website"; then 
  echo "Website is up." 
else 
  echo "Website is down." 
fi

##### 10. How can I clean up old files that haven't been modified in a certain number of days?
#!/bin/bash 
directory="/path/to/cleanup" 
find "$directory" -type f -mtime +7 -exec rm {} \; 
echo "Old files removed."

##### 11. How can I log CPU usage over time in Linux?
#!/bin/bash 
output_file="cpu_usage_log.txt" 
echo "$(date) $(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)%" >> "$output_file" 
echo "CPU usage logged."

##### 12. How can I gather system information and save it to a file?
#!/bin/bash 
output_file="system_info.txt" 
echo "System Information:" > "$output_file" 
echo "-------------------" >> "$output_file" 
echo "Hostname: $(hostname)" >> "$output_file" 
echo "OS: $(uname -a)" >> "$output_file" 
echo "Memory: $(free -h)" >> "$output_file" 
echo "Disk Space: $(df -h)" >> "$output_file" 
echo "System info saved to $output_file."

##### 13. How can I schedule a task to run at a specific time using cron?
#!/bin/bash 
scheduled_task="/path/to/your_script.sh" 
schedule_time="0 2 * * *" 
echo "$schedule_time $scheduled_task" | crontab - 
echo "Task scheduled successfully."

##### 14. How can I monitor disk space and alert if it exceeds a threshold?
#!/bin/bash 
threshold=90 
disk_usage=$(df -h | grep "/dev/sda1" | awk '{print $5}' | cut -d% -f1) 
if [ "$disk_usage" -gt "$threshold" ]; then 
  echo "High disk usage detected: $disk_usage%" 
  # Add alert/notification logic here 
fi

##### 15. How can I back up files to a remote server using rsync?
#!/bin/bash 
source_dir="/path/to/source" 
remote_server="user@remote_server:/path/to/backup" 
rsync -avz "$source_dir" "$remote_server" 
echo "Files backed up to remote server."

##### 16. How can I set up a development environment automatically?
#!/bin/bash 
# Customize the following lines based on your development environment setup 
echo "Setting up development environment..." 
# Install necessary packages, configure settings, etc. 
echo "Development environment set up successfully."

##### 17. How can I compress and decompress files in Linux?
#!/bin/bash 
file_to_compress="/path/to/file.txt" 
gzip "$file_to_compress" 
echo "File compressed: $file_to_compress.gz"

##### 18. How can I back up a MySQL database to a file?
#!/bin/bash 
database_name="your_database" 
output_file="database_backup_$(date +%Y%m%d).sql" 
mysqldump -u username -ppassword "$database_name" > "$output_file" 
echo "Database backup created: $output_file"

##### 19. How can I update a Git repository in Linux?
#!/bin/bash 
git_repo="/path/to/your/repo" 
cd "$git_repo" 
git pull origin master 
echo "Git repository updated."

##### 20. How can I synchronize directories between two locations?
#!/bin/bash 
source_dir="/path/to/source" 
destination_dir="/path/to/destination" 
rsync -avz "$source_dir" "$destination_dir" 
echo "Directories synchronized successfully."

##### 21. How can I analyze a web server log in Linux?
#!/bin/bash 
log_file="/var/log/apache2/access.log" 
awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr 
echo "Web server log analyzed."

##### 22. How can I perform a system health check and save results?
#!/bin/bash 
output_file="system_health_check.txt" 
echo "System Health Check:" > "$output_file" 
echo "---------------------" >> "$output_file" 
echo "Uptime: $(uptime)" >> "$output_file" 
echo "Load Average: $(cat /proc/loadavg)" >> "$output_file" 
echo "Memory Usage: $(free -m)" >> "$output_file" 
echo "System health check results saved to $output_file."

##### 23. How can I clean up old database backups?
#!/bin/bash 
database_name="your_database" 
days_to_keep=7 
find /path/to/database/backups -name "$database_name*.sql" -mtime +$days_to_keep -exec rm {} \; 
echo "Old database backups cleaned up."

##### 24. How can I check the expiration date of user passwords?
#!/bin/bash 
IFS=$'\n' 
for user in $(cat /etc/passwd | grep "/bin/bash" | cut -d: -f1); do 
  password_expires=$(chage -l "$user" | grep "Password expires" | awk '{print $4}') 
  echo "User: $user, Password Expires: $password_expires" 
done 
unset IFS

##### 25. How can I restart a service in Linux?
#!/bin/bash 
service_name="your_service" 
sudo systemctl restart "$service_name" 
echo "Service $service_name restarted."

##### 26. How can I check the size of a folder in Linux?
#!/bin/bash 
folder_path="/path/to/folder" 
du -sh "$folder_path" 
echo "Folder size checked."

##### 27. How can I perform backup rotation and limit the number of backups?
#!/bin/bash 
backup_dir="/path/to/backups" 
max_backups=5 
while [ $(ls -1 "$backup_dir" | wc -l) -gt "$max_backups" ]; do 
  oldest_backup=$(ls -1t "$backup_dir" | tail -n 1) 
  rm -r "$backup_dir/$oldest_backup" 
done 
echo "Backup rotation completed."

##### 28. How can I execute a script on a remote server?
#!/bin/bash 
remote_server="user@remote-server" 
remote_script="/path/to/remote/script.sh" 
ssh "$remote_server" "bash -s" < "$remote_script" 
echo "Remote script executed."

##### 29. How can I display network interface information in Linux?
#!/bin/bash 
network_interface="eth0" 
ifconfig "$network_interface" 
echo "Network interface information displayed."

##### 30. How can I generate a random quote from a list in Linux?
#!/bin/bash 
quotes=("Quote 1" "Quote 2" "Quote 3" "Quote 4") 
random_index=$((RANDOM % ${#quotes[@]})) 
echo "Random Quote: ${quotes[$random_index]}"
