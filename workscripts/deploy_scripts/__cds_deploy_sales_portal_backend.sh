# rm zzcds_deploy
# ln -s ../../zzPrivate/workscripts/deploy_scripts/cds_deploy_sales_portal_backend.sh zzcds_deploy

source ./__base_import

cd /home/user/projects/Workspace_2/sales_portal_backend

# ../zzcf_login $1 $2

if [ "$ZEXIST_NODE" == "" ];
then
    echo -e "\nnpm install\n"
    npm i
else
  echo -e "\nnode_modules exist\n"
fi

if [ "${2,,}" != "prd" ];
then
    echo -e "\n$1-${ZZ_CURR_TARGET,,}-setting\n"
    npm run $1-${ZZ_CURR_TARGET,,}-setting
else
    echo -e "\n${1,,}-${2,,}-setting\n"
    npm run ${1,,}-${2,,}-setting
fi

echo -e "\ncds build\n"
cds build

echo -e "\nstart cds deploy\n"
cds deploy
echo -e "\nend of cds deploy : ${ZZ_CURR_SPACE:16}\n"

if [ "${2,,}" == $_DEL_ ] || [ "${2,,}" == $_DELETE_ ] || [ "${3,,}" == $_DEL_ ] || [ "${3,,}" == $_DELETE_ ];
then
    echo -e "start delete node_modules\n"
    find ./* -name "node_modules" -exec rm -Rf {} +
    echo -e "end of delete node_modules\n"
fi
