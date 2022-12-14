# Automation_Project

Automation_Project

Upgrad assignment:

Assigned Tasks: You have been assigned to write an automation bash script named ‘automation.sh’ to perform the following subtasks. (Hint: Running ./automation.sh with root privileges must do the following listed tasks.) Your Script Should

    Perform an update of the package details and the package list at the start of the script.
    sudo apt update -y
    Install the apache2 package if it is not already installed. (The dpkg and apt commands are used to check the installation of the packages.)
    Ensure that the apache2 service is running.
    Ensure that the apache2 service is enabled. (The systemctl or service commands are used to check if the services are enabled and running. Enabling apache2 as a service ensures that it runs as soon as our machine reboots. It is a daemon process that runs in the background.)
    Create a tar archive of apache2 access logs and error logs that are present in the /var/log/apache2/ directory and place the tar into the /tmp/ directory. Create a tar of only the .log files (for example access.log) and not any other file type (For example: .zip and .tar) that are already present in the /var/log/apache2/ directory. The name of tar archive should have following format: -httpd-logs-.tar. For example: Ritik-httpd-logs-01212021-101010.tar Hint : use timestamp=$(date '+%d%m%Y-%H%M%S') )
    The script should run the AWS CLI command and copy the archive to the s3 bucket. #Hint : use timestamp=$(date '+%d%m%Y-%H%M%S') ) to name the tar aws s3
    cp /tmp/${myname}-httpd-logs-${timestamp}.tar
    s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar

Copying to the S3 bucket will require AWS Command Line Interface (CLI) to be installed in the system. You can install AWS CLI manually before writing and testing the script.
Installing awscli

sudo apt update sudo apt install awscli Important: • Your script must have a variable with a value as the name of your s3-bucket at the start. Use that variable at all places where the s3 bucket is to be referred to in the script. In the same manner, your script must initialise a variable with your name. • This project involves learning new concepts. So, you are encouraged to Google the commands and try out different things such as learn about cron job, services and commands like systemctl, dpkg and apt. • Place your script in '/root/Automation_Project/' directory. • Always run scripts with root privileges or first switch to the root user with sudo su and then run the scripts. • #Make the script executible • chmod +x /root/Automation_Project/automation.sh • #switch to root user with sudo su • sudo su • ./root/Automation_Project/automation.sh • • # or run with sudo privileges • sudo ./root/Automation_Project/automation.sh

Host Script On Github

    Initialise a Git repository with the name ‘Automation_Project’ and update the readme.md file which explains the project. This repository will now host your automation script
    Create a new ‘Dev’ branch and commit the script into it.
    Create a pull request from the ‘Dev’ to the master (called as ‘main’) branch in your GitHub repository.
    Finally, create a tag named ‘Automation-v0.1’ after you merge the ‘Dev’ branch to the main branch. You can use Github UI for the pull request and tagging

=================================================================================

(Update Automation.sh and ensure it achieves the following)

    Bookkeeping Ensure that your script checks for the presence of the inventory.html file in /var/www/html/; if not found, creates it. This file will essentially serve as a web page to get the metadata of the archived logs. (Hitting ip/inventory.html will show the bookkeeping data)

At any point in time, the first line in the inventory.html file should be a header that will look like this: cat /var/www/html/inventory.html

Log Type Time Created Type Size

If an inventory file already exists, the content of the file should not be deleted or overwritten. New content should be only appended in a new line.

When your script runs, it should create a new entry in the inventory.html file about the following: • What log type is archived? • Date when the logs were archived • The type of archive • The size of the archive Your inventory file should look like the following after multiple runs: cat /var/www/html/inventory.html

Log Type Date Created Type Size httpd-logs 010120201-100510 tar 10K httpd-logs 020120201-100510 tar 40K httpd-logs 030120201-100510 tar 4K httpd-logs 040120201-100510 tar 6K

Hint: Ensure that your columns are tab-separated (one or more tabs).

    Cron Job Your script should create a cron job file in /etc/cron.d/ with the name 'automation' that runs the script /root//automation.sh every day via the root user.

The script should be placed in the /root// directory. (Example: If your Git repository is named ‘Automation_Project’, the cron job will then run the script present in /root/Automation_Project/automation.sh)

Your automation script is supposed to check if a cron job is scheduled or not; if not, then it should schedule a cron job by creating a cron file in the /etc/cron.d/ folder.

Update Git Repository

    Commit this script into your 'Dev' branch and merge it into the master (or main) branch of your GitHub repository.
    Finally, create a tag ‘Automation-v0.2’ after merging your 'Dev' branch to the master branch via a pull request.



