# rm zzdeploy
# ln -s ../../zzPrivate/workscripts/deploy_scripts/deploy_sales_portal_home.sh zzdeploy

source ./__base_import

cd /home/user/projects/Workspace_2/sales_portal_home

# ../zzcf_login $1 $2

check_node_modules

npm run ${1,,}-home

delete_mta

echo -e "\nnpm build\n"
npm run build

echo -e "\nstart deploy\n"
npm run deploy
echo -e "\nend of deploy : ${ZZ_CURR_SPACE:16}\n"

if [ "${2,,}" == $_DEL_ ] || [ "${2,,}" == $_DELETE_ ] || [ "${3,,}" == $_DEL_ ] || [ "${3,,}" == $_DELETE_ ];
then
  del_node_modules
fi

del_makefile_mta
