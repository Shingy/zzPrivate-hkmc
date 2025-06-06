#!/bin/bash
# rm zzdeploy_all
# ln -s ../zzPrivate/workscripts/deploy_scripts/deploy_sales_portal_all.sh zzdeploy_all

cd /home/user/projects/zzPrivate/workscripts/deploy_scripts
source ./__base_import

cd /home/user/projects/Workspace_2

# ./zzcf_login $1 $2

echo -e "\n${GREEN}start deploy sales_portal :: $(generate_datetime 'formatted')${NOCOLOR}\n"

cd sales_portal
./zzdeploy $1 $2 $3

ZZ_CURR_SPACE=`cf target|grep space`
echo -e "${RED__}end of deploy sales_portal on ${ZZ_CURR_SPACE:16} :: $(generate_datetime 'formatted')\n"

echo -e "${GREEN}start deploy sales_portal_admin :: $(generate_datetime 'formatted')${NOCOLOR}\n"

cd ../sales_portal_admin
./zzdeploy $1 $2 $3

ZZ_CURR_SPACE=`cf target|grep space`
echo -e "${RED__}end of deploy sales_portal_admin on ${ZZ_CURR_SPACE:16} :: $(generate_datetime 'formatted')\n"

echo -e "${GREEN}start deploy sales_portal_api :: $(generate_datetime 'formatted')${NOCOLOR}\n"

cd ../sales_portal_api
./zzdeploy $1 $2 $3

ZZ_CURR_SPACE=`cf target|grep space`
echo -e "${RED__}end of deploy sales_portal_api on ${ZZ_CURR_SPACE:16} :: $(generate_datetime 'formatted')\n"

echo -e "${GREEN}start deploy sales_portal_backend :: $(generate_datetime 'formatted')${NOCOLOR}\n"

cd ../sales_portal_backend

echo -e "${BLUE_}start cds deploy :: $(generate_datetime 'formatted')${NOCOLOR}\n"

./zzcds_deploy $1 $2 $3

echo -e "${BLUE_}end of cds deploy :: $(generate_datetime 'formatted')\n"

echo -e "start service deploy :: $(generate_datetime 'formatted')${NOCOLOR}\n"

./zzdeploy $1 $2 $3

echo -e "${BLUE_}end of service deploy :: $(generate_datetime 'formatted')${NOCOLOR}\n"

ZZ_CURR_SPACE=`cf target|grep space`
echo -e "${RED__}end of deploy sales_portal_backend on ${ZZ_CURR_SPACE:16} :: $(generate_datetime 'formatted')\n"

echo -e "${GREEN}start deploy sales_portal_collaboration :: $(generate_datetime 'formatted')${NOCOLOR}\n"

cd ../sales_portal_collaboration
./zzdeploy $1 $2 $3

ZZ_CURR_SPACE=`cf target|grep space`
echo -e "${RED__}end of deploy sales_portal_collaboration on ${ZZ_CURR_SPACE:16} :: $(generate_datetime 'formatted')\n"

echo -e "${GREEN}start deploy sales_portal_home :: $(generate_datetime 'formatted')${NOCOLOR}\n"

cd ../sales_portal_home
./zzdeploy $1 $2 $3

ZZ_CURR_SPACE=`cf target|grep space`
echo -e "${RED__}end of deploy sales_portal_home on ${ZZ_CURR_SPACE:16} :: $(generate_datetime 'formatted')${NOCOLOR}\n"
