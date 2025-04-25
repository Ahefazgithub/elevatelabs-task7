
![netdata ss](https://github.com/user-attachments/assets/a66c8a24-5079-4cc2-906b-bd92e198ebab)

 
 
 Project Summary: Monitor System Resources Using Netdata
🟢 1. Launched an EC2 Instance

    Opened AWS Console and launched a new EC2 instance using:

        Amazon Linux 2 AMI

        Instance type: t2.micro or t2.small

        Configured Security Group:

            Allowed inbound SSH (port 22) for PuTTY access

            Allowed TCP port 19999 for Netdata dashboard access

        Created or used an existing key pair (.pem)

🟢 2. Connected to EC2 Using PuTTY

    Converted .pem to .ppk using PuTTYgen (if needed)

    Connected to the EC2 instance with:

    ec2-user@<your-ec2-public-ip>

🟢 3. Installed Docker on EC2

Executed the following commands:

sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -aG docker ec2-user

    Logged out and reconnected to apply Docker group changes

    Verified Docker was working with docker version

🟢 4. Deployed Netdata Using Docker

Ran the official Netdata container using:

docker run -d --name=netdata \
  -p 19999:19999 \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  -v netdataconfig:/etc/netdata \
  -v netdatalib:/var/lib/netdata \
  -v netdatacache:/var/cache/netdata \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /etc/group:/host/etc/group:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /etc/os-release:/host/etc/os-release:ro \
  netdata/netdata

🟢 5. Accessed Netdata Dashboard

    Opened the browser and accessed:

    http://<your-ec2-public-ip>:19999

    Viewed real-time monitoring of:

        CPU

        Memory

        Disk

        Network

        Docker containers

🟢 6. Explored Logs and Metrics

    Entered the Netdata container to check logs:

    docker exec -it netdata bash
    cd /var/log/netdata

    Checked alerts and charts on the dashboard

🟢 7. Captured and Submitted Deliverables

    Took a screenshot of the Netdata dashboard

    Pushed the screenshot to a GitHub repo

    Submitted the GitHub repository link as the final deliverable

✅ Tools Used:

    AWS EC2

    Amazon Linux 2

    PuTTY

    Docker

    Netdata

    GitHub
