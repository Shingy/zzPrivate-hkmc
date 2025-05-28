# rm zzdeploy
# ln -s ../../zzPrivate/workscripts/deploy_scripts/deploy_sales_portal_admin.sh zzdeploy

ZZ_IS_SETTING_MODE="setting"

cd /home/user/projects/Workspace_2/sales_portal_admin

# ../zzcf_login $1 $2

ZZ_CURR_SPACE=`cf target|grep space`

ZEXIST_NODE=`find ./* -name "node_modules"`
if [ "$ZEXIST_NODE" == "" ];
then
    echo -e "\nnpm install\n"
    npm i
else
  echo -e "\nnode_modules exist\n"
fi

rm mta_archives/*.mtar

echo -e "\nnpm build\n"
npm run build

if [ "${2,,}" != "${ZZ_IS_SETTING_MODE}" ] || ([ "$3" != "" ] && [ "${3,,}" != "${ZZ_IS_SETTING_MODE}" ]);
then
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
