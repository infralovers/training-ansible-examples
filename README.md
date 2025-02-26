# playbooks

## install ansible

### install ansible by pip within a python virtualenv

```bash
virtualenv venv
source venv/bin/activate
pip3 install -r requirements.txt
```

## create ssh key

```bash
# for testing purposes we only the defaults without a passphrase
ssh-keygen
```

## copy ssh identity to all hosts

```bash
ssh-copy-id <ENV-NAME>-<ENV-USER-ID>-01.<ENV-ANIMAL>.<ENV-DOMAIN>
ssh-copy-id <ENV-NAME>-<ENV-USER-ID>-02.<ENV-ANIMAL>.<ENV-DOMAIN>
ssh-copy-id <ENV-NAME>-<ENV-USER-ID>-03.<ENV-ANIMAL>.<ENV-DOMAIN>
```

## update inventory

```shell
replace_variables
```

### execute play

test ansible config with `server.yml`

```bash
ansible-playbook server.yml
```

## install cinc

```bash
$ curl -L https://omnitruck.cinc.sh/install.sh \
  | sudo bash -s -- -P cinc-workstation \
  -v 20.8.125 -c unstable
```

```bash
$ # on centos 8
$ sudo dnf group install "Development Tools"
```

- Installation of the ansible provisioner
- Installation of the docker driver

```bash
$ chef gem install kitchen-ansible
$ chef gem install kitchen-docker
```

## Use remote docker with kitchen

```bash
ssh coder@<ENV-NAME>-<ENV-USER-ID>-01.<ENV-ANIMAL>.<ENV-DOMAIN> hostname -f

# now use that as youre remote host
REMOTE_HOST=$(ssh coder@<ENV-NAME>-<ENV-USER-ID>-01.<ENV-ANIMAL>.<ENV-DOMAIN> hostname -f)
export DOCKER_HOST=tcp://$REMOTE_HOST:2375
# check what you've got
echo $DOCKER_HOST
# chef if it is working
docker ps
```

## Helpful Commands

use inspec to get compliance state of linux node:

```bash
cinc-auditor exec -i ~/.ssh/id_rsa \
-t ssh://coder@<ENV-NAME>-<ENV-USER-ID>-01.<ENV-ANIMAL>.<ENV-DOMAIN> \
https://github.com/dev-sec/linux-baseline.git
```

run your inspec test against remote node:

```bash
cinc-auditor exec -i ~/.ssh/id_rsa \
-t ssh://coder@<ENV-NAME>-<ENV-USER-ID>-01.<ENV-ANIMAL>.<ENV-DOMAIN> \
~/playbooks/roles/webserver/test/integration/default/inspec/
```

get the httpd config for centos-7

```bash
scp coder@h<ENV-NAME>-<ENV-USER-ID>-01.<ENV-ANIMAL>.<ENV-DOMAIN>:\
/etc/httpd/conf/httpd.conf \
~/playbooks/roles/webserver/templates/httpd.conf.8.j2
```

get the httpd config for centos-6 from kitchen

```bash
# get the port:
cd ~/playbooks/roles/webserver/
cat .kitchen/default-centos-67.yml
# now use that port in the scp commmand
scp -P <the-port-number> -i .kitchen/docker_id_rsa kitchen@127.0.0.1:/etc/httpd/conf/httpd.conf templates/httpd.conf.6.j2
```
