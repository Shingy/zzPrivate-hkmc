# rm zzcds_deploy
# ln -s ../../zzPrivate/workscripts/deploy_scripts/cds_deploy_sales_portal_backend.sh zzcds_deploy

source ./__base_import

cd /home/user/projects/Workspace_2/sales_portal_backend

# ../zzcf_login $1 $2

if [ "${2,,}" != "prd" ];
then
    echo -e "\n${RED__}$1-${ZZ_CURR_TARGET,,}-setting${NOCOLOR}\n"
    npm run $1-${ZZ_CURR_TARGET,,}-setting
else
    echo -e "\n${RED__}${1,,}-${2,,}-setting${NOCOLOR}\n"
    npm run ${1,,}-${2,,}-setting
fi

echo -e "\n${RED__}cds build${NOCOLOR}\n"
cds build

doDeploy

if [ "${2,,}" == $_DEL_ ] || [ "${2,,}" == $_DELETE_ ] || [ "${3,,}" == $_DEL_ ] || [ "${3,,}" == $_DELETE_ ];
then
    del_node_modules
fi
