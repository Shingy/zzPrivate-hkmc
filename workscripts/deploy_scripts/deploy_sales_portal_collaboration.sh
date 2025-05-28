cd /home/user/projects/zzPrivate/workscripts/deploy_scripts

../../commands/cf_login.sh $1 $2

ZZ_CURR_SPACE=`cf target|grep space`
ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_CURR_TARGET}" == "" ];
then
    ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
fi

# find /home/user/projects/Workspace_2/sales_portal_collaboration/zzdeploy_log -name "_collaboration_${ZZ_CURR_SPACE:16}_*.log" -mtime +2 -delete
# ./__deploy_sales_portal_collaboration.sh $1 $2 $3 > /home/user/projects/Workspace_2/sales_portal_collaboration/zzdeploy_log/_collaboration_${ZZ_CURR_SPACE:16}_`date -d "+9 hours" +%y%m%d%H%M%S`.log

find /home/user/projects/Workspace_2/zzdeploy_logs -name "_collaboration_${ZZ_CURR_SPACE:16}_*.log" -mtime +2 -delete
./__deploy_sales_portal_collaboration.sh $1 $2 $3 > /home/user/projects/Workspace_2/zzdeploy_logs/_collaboration_${ZZ_CURR_SPACE:16}_`date -d "+9 hours" +%y%m%d_%H%M%S`.log
