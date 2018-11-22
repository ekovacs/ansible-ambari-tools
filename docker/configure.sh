#!/bin/bash -x

set -eEuo pipefail
sut=/shared-volume/system_under_test.yaml
if [ -f ${sut} ]; then
AMBARI_PASSWORD=$(yq read ${sut} services[0].credentials[0].password)
AMBARI_USER=$(yq read ${sut} services[0].credentials[0].username)
AMBARI_HOST=$(yq read ${sut} services[0].hosts[0].name)
fi

sed -i -e "s|AMBARI_HOST|$AMBARI_HOST|" "ambari.cfg"
sed -i -e "s|AMBARI_USER|$AMBARI_USER|" "ambari.cfg"
sed -i -e "s|AMBARI_PASSWORD|$AMBARI_PASSWORD|" "ambari.cfg"

source .venv/bin/activate
pip3 install -r requirements.txt

# run the playbook passed as an argument
ansible-playbook -vv $1