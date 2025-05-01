# in Workspace_2 :
# ln -s ../zzPrivate/commands/git_pull/all_2nd.sh zzgit_pull
# ./zzgit_pull

echo -e "\nstart git_pull hacc_1300 projects\n"

echo -e "====================================\n"

echo -e "start git pull common_1300\n"
cd /home/user/projects/hacc_1300/common_1300
git pull
echo -e "\nend of git pull common_1300\n"

echo -e "====================================\n"

echo -e "start git pull dealer_statement_1300\n"
cd ../dealer_statement_1300
git pull
echo -e "\nend of git pull dealer_statement_1300\n"

echo -e "====================================\n"

echo -e "start git pull etc_1300\n"
cd ../etc_1300
git pull
echo -e "\nend of git pull etc_1300\n"

echo -e "====================================\n"

echo -e "start git pull fleet_1300\n"
cd ../fleet_1300
git pull
echo -e "\nend of git pull fleet_1300\n"

echo -e "====================================\n"

echo -e "start git pull incentive_1300\n"
cd ../incentive_1300
git pull
echo -e "\nend of git pull incentive_1300\n"

echo -e "====================================\n"

echo -e "start git pull order_1300\n"
cd ../order_1300
git pull
echo -e "\nend of git pull order_1300\n"

echo -e "====================================\n"

echo -e "start git pull sales_1300\n"
cd ../sales_1300
git pull
echo -e "\nend of git pull sales_1300\n"

echo -e "====================================\n"

echo -e "start git pull stock_1300\n"
cd ../stock_1300
git pull
echo -e "\nend of git pull stock_1300\n"

echo -e "====================================\n"

echo -e "end of git_pull hacc_1300 projects\n"
