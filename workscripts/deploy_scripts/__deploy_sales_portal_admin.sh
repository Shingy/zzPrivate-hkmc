# rm zzdeploy
# ln -s ../../zzPrivate/workscripts/deploy_scripts/deploy_sales_portal_admin.sh zzdeploy

source ./__base_import

cd /home/user/projects/Workspace_2/sales_portal_admin

# ../zzcf_login $1 $2

check_node_modules

delete_mta

echo -e "\n${RED__}npm build${NOCOLOR}\n"
npm run build

if [ "${2,,}" != "${ZZ_IS_SETTING_MODE}" ] || ([ "$3" != "" ] && [ "${3,,}" != "${ZZ_IS_SETTING_MODE}" ]);
then
  doDeploy
fi

if [ "${2,,}" == $_DEL_ ] || [ "${2,,}" == $_DELETE_ ] || [ "${3,,}" == $_DEL_ ] || [ "${3,,}" == $_DELETE_ ];
then
  del_node_modules
fi

del_makefile_mta
