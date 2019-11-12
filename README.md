# playbooks

install ansible

```bash
sudo /usr/bin/pip-3.6 install ansible
```

create ssh key

```
ssh-keygen
```

copy ssh identity to all hosts

```
ssh-copy-id centos@host-git-<your-number>.commandemy.training
ssh-copy-id centos@host-git-<your-number>.commandemy.training
ssh-copy-id centos@host-git-<your-number>.commandemy.training
```

update `~/playbooks/inventory` with your host <your-number> entries

test ansible config with `server.yml`

```
cd playbooks
ansible-playbook server.yml
```

## install chefdk

```
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -v 3.12.10
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
~/playbooks/roles/webserver/templates/httpd.conf.j2
```

```
scp -P 32771 -i .kitchen/docker_id_rsa kitchen@127.0.0.1:/etc/httpd/conf/httpd.conf templates/httpd.conf.6.j2
```
