cd /home/user/projects/zzPrivate/workscripts/deploy_scripts

../../commands/cf_login.sh $1 $2

source ./__base_import

find /home/user/projects/Workspace_2/zzdeploy_logs/${1^^} -name "_${ZZ_LOG_SPACE}_backend_cds_*.log" $ZZ_MTIME_OR_MMIN -delete
./__cds_deploy_sales_portal_backend.sh $1 $2 $3 > /home/user/projects/Workspace_2/zzdeploy_logs/${1^^}/_${ZZ_LOG_SPACE}_backend_cds_`date -d "+9 hours" +%y%m%d_%H%M%S`.log
