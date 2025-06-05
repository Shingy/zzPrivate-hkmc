#!/bin/bash
# in Workspace_2 :
# ln -s ../zzPrivate/commands/git_pull/company/kca.sh zzgit_pull
# ./zzgit_pull

echo -e "\nstart git_pull kmx_2d00 projects\n"

echo -e "====================================\n"

echo -e "start git pull admin_2d00\n"
cd /home/user/projects/kmx_2d00/admin_2d00
git pull
echo -e "\nend of git pull admin_2d00\n"

echo -e "====================================\n"

echo -e "start git pull apartados_2d00\n"
cd /home/user/projects/kmx_2d00/apartados_2d00
git pull
echo -e "\nend of git pull apartados_2d00\n"

echo -e "====================================\n"

echo -e "start git pull common_2d00\n"
cd ../common_2d00
git pull
echo -e "\nend of git pull common_2d00\n"

echo -e "====================================\n"

echo -e "start git pull dashboard_2d00\n"
cd ../dashboard_2d00
git pull
echo -e "\nend of git pull dashboard_2d00\n"

echo -e "====================================\n"

echo -e "start git pull fleet_2d00\n"
cd ../fleet_2d00
git pull
echo -e "\nend of git pull fleet_2d00\n"

echo -e "====================================\n"

echo -e "start git pull incentives_2d00\n"
cd ../incentives_2d00
git pull
echo -e "\nend of git pull incentives_2d00\n"

echo -e "====================================\n"

echo -e "start git pull invoice_2d00\n"
cd ../invoice_2d00
git pull
echo -e "\nend of git pull invoice_2d00\n"

echo -e "====================================\n"

echo -e "start git pull lead_management_2d00\n"
cd ../lead_management_2d00
git pull
echo -e "\nend of git pull lead_management_2d00\n"

echo -e "====================================\n"

echo -e "start git pull order_2d00\n"
cd ../order_2d00
git pull
echo -e "\nend of git pull order_2d00\n"

echo -e "====================================\n"

echo -e "start git pull parts_2d00\n"
cd ../parts_2d00
git pull
echo -e "\nend of git pull parts_2d00\n"

echo -e "====================================\n"

echo -e "start git pull report_2d00\n"
cd ../report_2d00
git pull
echo -e "\nend of git pull report_2d00\n"

echo -e "====================================\n"

echo -e "start git pull sales_2d00\n"
cd ../sales_2d00
git pull
echo -e "\nend of git pull sales_2d00\n"

echo -e "====================================\n"

echo -e "start git pull scheduler_2d00\n"
cd ../scheduler_2d00
git pull
echo -e "\nend of git pull scheduler_2d00\n"

echo -e "====================================\n"

echo -e "start git pull stock_2d00\n"
cd ../stock_2d00
git pull
echo -e "\nend of git pull stock_2d00\n"

echo -e "====================================\n"

echo -e "start git pull training_2d00\n"
cd ../training_2d00
git pull
echo -e "\nend of git pull training_2d00\n"

echo -e "====================================\n"

echo -e "end of git_pull kmx_2d00 projects\n"
