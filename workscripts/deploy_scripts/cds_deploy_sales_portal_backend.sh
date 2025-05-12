cd /home/user/projects/zzPrivate/workscripts/deploy_scripts

../../commands/cf_login.sh $1 $2

ZZ_CURR_SPACE=`cf target|grep space`
ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_CURR_TARGET}" == "" ];
then
    ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
fi

./__cds_deploy_sales_portal_backend.sh $1 $2 $3 > /home/user/projects/Workspace_2/sales_portal_backend/zzdeploy_log/_backend_cds_${ZZ_CURR_SPACE:16}_`date -d "+9 hours" +%y%m%d%H%M%S`.log
