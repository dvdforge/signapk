#!/bin/bash
rm *_out.apk
SIGNAPK="./signapk sign -v"
APKSIGN="java -Xmx1024M -Xss1m -jar apksigner.jar sign"
APKVERIFY="java -Xmx1024M -Xss1m -jar apksigner.jar verify --verbose"

SIGNARG="--ks-pass pass:android --key-pass pass:android --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true"
for A in rsa_1024 rsa_2048 rsa_4096 rsa_8192 rsa_16384 ec_256 ec_384 ec_521 dsa_1024 dsa_2048 dsa_3072
do
    echo ----------------------------------
    echo SignApk ${A}.jks in.apk ${A}_out.apk
    $SIGNAPK $SIGNARG --ks ${A}.jks in.apk ${A}_out.apk
    $APKVERIFY ${A}_out.apk
done
