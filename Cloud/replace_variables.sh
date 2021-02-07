#!/bin/bash

scripts_dir=$2

echo $1
echo $scripts_dir

cloud_files () {
   for i in {1..4}; do
       sed -i "s|<S3BUCKET_ACCESS>|${S3BUCKET_ACCESS}|g" ${scripts_dir}/terraform/cloud_init_hm${i}.cfg
       sed -i "s|<S3BUCKET_SECRET>|${S3BUCKET_SECRET}|g" ${scripts_dir}/terraform/cloud_init_hm${i}.cfg
       sed -i "s|<PASSWD1>|${PASSWD1}|g" ${scripts_dir}/terraform/cloud_init_hm${i}.cfg
       sed -i "s|<PASSWD2>|${PASSWD2}|g" ${scripts_dir}/terraform/cloud_init_hm${i}.cfg
       sed -i "s|<PASSWD3>|${PASSWD3}|g" ${scripts_dir}/terraform/cloud_init_hm${i}.cfg
       sed -i "s|<PASSWD4>|${PASSWD4}|g" ${scripts_dir}/terraform/cloud_init_hm${i}.cfg
   done
}

# Credentials for GITHUB
if [ $1 == "github"  ]; then
  AWS_ACCESS_KEY=""
  AWS_SECRET_KEY=""
  PASSWD1=''
  PASSWD2=''
  PASSWD3=''
  PASSWD4=''
  S3BUCKET_ACCESS=''
  S3BUCKET_SECRET=''
  cloud_files
  sed -i "s|<AWS_ACCESS_KEY>|${AWS_ACCESS_KEY}|g" ${scripts_dir}/.aws/credentials
  sed -i "s|<AWS_SECRET_KEY>|${AWS_SECRET_KEY}|g" ${scripts_dir}/.aws/credentials
fi

if [ $1 == "gitlab"  ]; then
  AWS_ACCESS_KEY=""
  AWS_SECRET_KEY=""
  PASSWD1=''
  PASSWD2=''
  PASSWD3=''
  PASSWD4=''
  S3BUCKET_ACCESS=''
  S3BUCKET_SECRET=''
  cloud_files
  sed -i "s|<AWS_ACCESS_KEY>|${AWS_ACCESS_KEY}|g" ${scripts_dir}/.aws/credentials
  sed -i "s|<AWS_SECRET_KEY>|${AWS_SECRET_KEY}|g" ${scripts_dir}/.aws/credentials
fi

if [ $1 == "bitbucket"  ]; then
  AWS_ACCESS_KEY=""
  AWS_SECRET_KEY=""
  PASSWD1=''
  PASSWD2=''
  PASSWD3=''
  PASSWD4=''
  S3BUCKET_ACCESS=''
  S3BUCKET_SECRET=''
  cloud_files
  sed -i "s|<AWS_ACCESS_KEY>|${AWS_ACCESS_KEY}|g" ${scripts_dir}/.aws/credentials
  sed -i "s|<AWS_SECRET_KEY>|${AWS_SECRET_KEY}|g" ${scripts_dir}/.aws/credentials
fi

if [ $1 == "sourceforge"  ]; then
  AWS_ACCESS_KEY=""
  AWS_SECRET_KEY=""
  PASSWD1=''
  PASSWD2=''
  PASSWD3=''
  PASSWD4=''
  S3BUCKET_ACCESS=''
  S3BUCKET_SECRET=''
  cloud_files
  sed -i "s|<AWS_ACCESS_KEY>|${AWS_ACCESS_KEY}|g" ${scripts_dir}/.aws/credentials
  sed -i "s|<AWS_SECRET_KEY>|${AWS_SECRET_KEY}|g" ${scripts_dir}/.aws/credentials
fi
