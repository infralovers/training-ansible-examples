# playbooks

install ansible

```bash
sudo yum install ansible -y
```

create ssh key

```
ssh-keygen -t rsa
```

copy ssh identity to all hosts

```
ssh-copy-id centos@host-git-<your-number>.commandemy.training
ssh-copy-id centos@host-git-<your-number>.commandemy.training
ssh-copy-id centos@host-git-<your-number>.commandemy.training
```

update `~/playbooks/hosts` with your host <your-number> entries

test ansible config with `server.yml`

```
cd playbooks
ansible-playbook server.yml
```

## install chefdk

```
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -v 3.11.3
```

```
chef gem install kitchen-ansible
chef gem install kitchen-docker
```

delete some docker images

```
docker image rm lambci/lambda:nodejs8.10
docker image rm lambci/lambda:nodejs6.10
docker image rm lambci/lambda:nodejs4.3 
```

## Helpful Commands

```
inspec exec -i ~/.ssh/id_rsa \
-t ssh://centos@host-git-<your-number>.commandemy.training \
https://github.com/dev-sec/linux-baseline.git
```

```
scp centos@host-git-<your-number>.commandemy.training:\
/etc/httpd/conf/httpd.conf \
~/roles/webserver/templates/httpd.conf.j2
```
