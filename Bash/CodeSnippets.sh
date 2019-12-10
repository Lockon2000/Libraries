# cd to script path
cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1

# Programmatically change PasswordAuthentication to yes in sshd_config
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config