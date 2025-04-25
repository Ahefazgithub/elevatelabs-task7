clear
yum update -y
clear
yum install git -y
sudo yum install git -y
sudo yum install docker -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -aG docker ec2-user
exit
