#!/bin/bash
ZZ_API_ENDPOINT="https://api.cf.us10-001.hana.ondemand.com";
ZZ_EMAIL="9485147@ict-companion.com"
ZZ_PW="Qwert12#$%"
ZZ_SPACE_PRIFIX="$1"
# set target(dev/prd/temp)
if [ "$2" != "" ];
then
    ZZ_ORG="$2"
    ZZ_TARGET="$2"
    if [ "${2,,}" == "cicdtest" ];
    then
        ZZ_TARGET="DEV_${ZZ_TARGET^^}"
    elif [ "${2,,}" != "design" ];
    then
        if [ "${2,,}" == "temp" ] || [ "${2,,}" == "del" ] || [ "${2,,}" == "delete" ];
        then
            ZZ_ORG="dev"
            ZZ_TARGET="TEMP"
        else
            ZZ_TARGET="$2"
            ZZ_TARGET="${ZZ_TARGET^^}"
        fi
    else
        ZZ_TARGET="Design"
    fi
else
    if [ "${1,,}" == "hacc" ];
    then
        ZZ_TARGET="DEV_CICDTEST"
    elif [ "${1,,}" == "kmx" ];
    then
        ZZ_TARGET="DEV"
    else
        ZZ_ORG="dev"
        ZZ_TARGET="TEMP"
    fi
fi

if [ "$1" != "" ];
then
    if [ "${1,,}" == "hacc" ];
    then
        cf login -a $ZZ_API_ENDPOINT -u $ZZ_EMAIL -p $ZZ_PW -o $1-orgdev -s "${ZZ_SPACE_PRIFIX^^}"_$ZZ_TARGET
        #cf login -a https://api.cf.us10-001.hana.ondemand.com -u 9485147@ict-companion.com -p Qwert12#$% -o hacc-orgdev -s HACC_DEV
    elif [ "${1,,}" == "kmx" ];
    then
       cf login -a $ZZ_API_ENDPOINT -u $ZZ_EMAIL -p $ZZ_PW -o $1-orgsalesdev -s "${ZZ_SPACE_PRIFIX^^}"_Sales_$ZZ_TARGET
    elif [ "${1,,}" == "hma" ] || [ "${1,,}" == "hmm" ] || [ "${1,,}" == "kca" ] || [ "${1,,}" == "kus" ];
    then
        ZZ_CURR_SPACE=`cf target|grep space`
        ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
        if [ "${ZZ_CURR_TARGET}" == "" ];
        then
            ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
        fi

        if [ "${ZZ_TARGET^^}" != "PRD" ];
        then
            if [ "${ZZ_SPACE_PRIFIX^^}_$ZZ_TARGET" != "${ZZ_CURR_SPACE:16}" ];
            then
                cf login -a $ZZ_API_ENDPOINT -u $ZZ_EMAIL -p $ZZ_PW -o $1-$ZZ_ORG-org -s ${ZZ_SPACE_PRIFIX^^}_$ZZ_TARGET
            else
                cf target
            fi
        else
            if [ "${1^^}_${ZZ_SPACE_PRIFIX^^}" != "${1^^}_$ZZ_CURR_TARGET" ];
            then
                cf login -a $ZZ_API_ENDPOINT -u $ZZ_EMAIL -p $ZZ_PW -o $1-org -s ${ZZ_SPACE_PRIFIX^^}
            else
                cf target
            fi
        fi
    else
        echo "Invalid environment. Please check org and space."
        exit 1
    fi
else
    cf login -a $ZZ_API_ENDPOINT -u $ZZ_EMAIL -p $ZZ_PW
fi

#cf login -a https://api.cf.us10-001.hana.ondemand.com -u 9485147@ict-companion.com -p Qwert12#$% -o kmx-orgsalesdev -s KMX_Sales_DEV
#cf login -a https://api.cf.us10-001.hana.ondemand.com -u 9470907@ict-companion.com -p Ttra6556!!  -o kmx-orgsalesdev -s KMX_Sales_DEV
