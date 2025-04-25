# rm zzdeploy
# ln -s ../../zzPrivate/workscripts/deploy_scripts/deploy_sales_portal_backend.sh zzdeploy

cd /home/user/projects/Workspace_2/sales_portal_backend

../zzcf_login $1 $2

ZZ_SPACE=`cf target|grep space`
ZZ_TARGET=$(echo ${ZZ_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_TARGET}" == "" ];
then
    ZZ_TARGET=$(echo ${ZZ_SPACE:16}|cut -d'_' -f 2)
fi

ZEXIST_NODE=`find ./* -name "node_modules"`
if [ "$ZEXIST_NODE" == "" ];
then
    echo -e "\nnpm install\n"
    npm i
else
  echo -e "\nnode_modules exist\n"
fi

echo -e "\nnpm build\n"
if [ "${2,,}" != "prd" ];
then
    npm run build:$1-${ZZ_TARGET,,}
else
    npm run build:$1-${2,,}
fi

echo -e "\nstart deploy\n"
npm run deploy
echo -e "\nend of deploy : ${2^^}\n"

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
