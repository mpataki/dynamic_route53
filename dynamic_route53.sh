
PUBLIC_IP=`dig TXT +short o-o.myaddr.l.google.com @ns1.google.com`
HOSTED_ZONE_NAME=$1
HOSTED_ZONE_ID=$2

aws cloudformation update-stack \
  --stack-name HomeDynamicDNS \
  --template-body file://home_record_set.yml \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameters \
      ParameterKey=IP,ParameterValue=$PUBLIC_IP \
      ParameterKey=HostedZoneName,ParameterValue=$HOSTED_ZONE_NAME \
      ParameterKey=HostedZoneID,ParameterValue=$HOSTED_ZONE_ID

