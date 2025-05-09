# rm zzdeploy
# ln -s ../../zzPrivate/workscripts/deploy_scripts/deploy_sales_portal.sh zzdeploy

ZZ_IS_SETTING_MODE="setting"

cd /home/user/projects/Workspace_2/sales_portal

# ../zzcf_login $1 $2

ZZ_CURR_SPACE=`cf target|grep space`
ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_CURR_TARGET}" == "" ];
then
    ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
fi

ZEXIST_APP_NODE=`find ./approuter-local/* -name "node_modules"`
ZEXIST_NODE=`find ./* -name "node_modules"`
if [ "$ZEXIST_NODE" == "" ] || [ "$ZEXIST_APP_NODE" == "" ];
then
    echo -e "\nnpm install\n"
    npm i
    cd approuter-local
    npm i
    cd ..
else
  echo -e "\nnode_modules exist\n"
fi

if [ "$2" == "${ZZ_IS_SETTING_MODE}" ] || [ "$3" == "${ZZ_IS_SETTING_MODE}" ];
then
    echo -e "\nstart $1-${ZZ_CURR_TARGET,,}-setting\n"
    npm run $1-${ZZ_CURR_TARGET,,}-setting
    echo -e "\nend of $1-${ZZ_CURR_TARGET,,}-setting\n"
else
    echo -e "\nnpm build\n"
    if [ "${2,,}" != "prd" ];
    then
        npm run build:$1-${ZZ_CURR_TARGET,,}
    else
        npm run build:$1-${2,,}
    fi

    echo -e "\nstart deploy\n"
    npm run deploy
    echo -e "\nend of deploy : ${ZZ_CURR_SPACE:16}\n"
fi

if [ "${2,,}" == "del" ] || [ "${2,,}" == "delete" ] || [ "${3,,}" == "del" ] || [ "${3,,}" == "delete" ];
then
    echo -e "start delete node_modules\n"
    find ./* -name "node_modules" -exec rm -Rf {} +
    echo -e "end of delete node_modules\n"
fi

ZCHECK_MTA=`find ./* -name "Makefile_*.mta"`
if [ "$ZCHECK_MTA" != "" ];
then
  echo Delete Makefile_*.mta files
  rm Makefile_*.mta
fi
