# rm zzcds_deploy
# ln -s ../../zzPrivate/workscripts/deploy_scripts/cds_deploy_sales_portal_backend.sh zzcds_deploy

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

if [ "${2,,}" != "prd" ];
then
    echo -e "\n$1-${ZZ_TARGET,,}-setting\n"
    npm run $1-${ZZ_TARGET,,}-setting
else
    echo -e "\n$1-${2,,}-setting\n"
    npm run $1-${2,,}-setting
fi

echo -e "\ncds build\n"
cds build

echo -e "\nstart cds deploy\n"
cds deploy
echo -e "\nend of cds deploy : ${2^^}\n"

if [ "${2,,}" == "del" ] || [ "${2,,}" == "delete" ] || [ "${3,,}" == "del" ] || [ "${3,,}" == "delete" ];
then
    echo -e "start delete node_modules\n"
    find ./* -name "node_modules" -exec rm -Rf {} +
    echo -e "end of delete node_modules\n"
fi
