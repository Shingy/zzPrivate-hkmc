# rm zzdeploy
# ln -s ../../zzPrivate/workscripts/deploy_scripts/deploy_sales_portal.sh zzdeploy

source ./__base_import

cd /home/user/projects/Workspace_2/sales_portal

# ../zzcf_login $1 $2

check_node_modules_sp

if [ "${2,,}" == "${ZZ_IS_SETTING_MODE}" ] || [ "${3,,}" == "${ZZ_IS_SETTING_MODE}" ];
then
    echo -e "\nstart $1-${ZZ_CURR_TARGET,,}-setting\n"
    npm run ${1,,}-${ZZ_CURR_TARGET,,}-setting
    echo -e "\nend of ${1,,}-${ZZ_CURR_TARGET,,}-setting\n"
else
    delete_mta

    echo -e "\nnpm build\n"
    if [ "${2,,}" != "prd" ];
    then
        npm run build:${1,,}-${ZZ_CURR_TARGET,,}
    else
        npm run build:${1,,}-${2,,}
    fi

    echo -e "\nstart deploy\n"
    npm run deploy
    echo -e "\nend of deploy : ${ZZ_CURR_SPACE:16}\n"
fi

if [ "${2,,}" == $_DEL_ ] || [ "${2,,}" == $_DELETE_ ] || [ "${3,,}" == $_DEL_ ] || [ "${3,,}" == $_DELETE_ ];
then
    del_node_modules
fi

del_makefile_mta
