
PUBLIC_IP=`dig TXT +short o-o.myaddr.l.google.com @ns1.google.com`
HOSTED_ZONE=$1

aws cloudformation create-stack \
  --profile personal \
  --stack-name HomeDynamicDNS \
  --template-body file://home_record_set.yml \
  --parameters \
      ParameterKey=IP,ParameterValue=$PUBLIC_IP \
      ParameterKey=HostedZoneName,ParameterValue=$HOSTED_ZONE

