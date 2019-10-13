# playbooks

install ansible

```bash
sudo yum install ansible
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

install chefdk

```
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -v 3.11.3
```

```
chef gem install kitchen-ansible
chef gem install kitchen-docker
```
