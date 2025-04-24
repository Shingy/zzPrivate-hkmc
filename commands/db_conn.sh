TARGET="$2"
if [ "$1" == "hyundai" ] || [ "$1" == "h" ];
then
    if [ "${TARGET^^}" == "PRD" ];
    then
        cf login -a https://api.cf.us10-001.hana.ondemand.com -u 9485147@ict-companion.com -p Qwert12#$% -o am-h-prddborg -s DB_PRD
        cf ssh -L 5402:postgres-25297b38-e95b-4776-9446-68e9fb90362e.cqryblsdrbcs.us-east-1.rds.amazonaws.com:5402 db-connector
    else
        cf login -a https://api.cf.us10-001.hana.ondemand.com -u 9485147@ict-companion.com -p Qwert12#$% -o america-hyundai-orgdev -s "Common DEV"
        cf ssh -L 63306:postgres-710b4ab9-204b-4ba9-8728-13d1de4b2bab.cqryblsdrbcs.us-east-1.rds.amazonaws.com:6489 postgres-ssh-app
    fi
elif [ "$1" == "kia" ] || [ "$1" == "k" ];
then
    if [ "${TARGET^^}" == "PRD" ];
    then
        cf login -a https://api.cf.us10-001.hana.ondemand.com -u 9485147@ict-companion.com -p Qwert12#$% -o am-k-prddborg -s DB_PRD
        cf ssh -L 6990:postgres-9fd4fb08-ca0b-4fd2-bd91-e9980c3d14c0.cqryblsdrbcs.us-east-1.rds.amazonaws.com:6990 db-connector
    else
        cf login -a https://api.cf.us10-001.hana.ondemand.com -u 9485147@ict-companion.com -p Qwert12#$% -o america-kia-orgdev -s "Common DEV"
        cf ssh -L 63307:postgres-3685142e-39b7-45ad-b6ba-8dd1257a3fc9.cqryblsdrbcs.us-east-1.rds.amazonaws.com:1874 postgres-ssh-app-srv
    fi
else
    echo no action.
fi