#!/bin/bash
# in Workspace_2 :
# ln -s ../zzPrivate/commands/git_pull/common2.sh zzgit_pull
# ln -s ../zzPrivate/commands/git_pull/all_2nd.sh zzgit_pull

if [ "$1" != "" ];
then
    # echo ${1,,}

    if [ "${1,,}" == "all" ];
    then
        if [ "$2" == "1" ];
        then
            ./common1.sh
        elif [ "$2" == "2" ];
        then
            ./common2.sh
        else
            ./common1.sh
            ./common2.sh
        fi

        if [ $? -ne 0 ];
        then
            cd /home/user/projects/zzPrivate/commands/git_pull
            if [ "$2" == "1" ];
            then
                ./common1.sh
            elif [ "$2" == "2" ];
            then
                ./common2.sh
            else
                ./common1.sh
                ./common2.sh
            fi
        fi

        ./company/hacc.sh
        ./company/kmx.sh
        ./company/hmm.sh
        ./company/kca.sh

    elif [ "$1" == "1" ];
    then
        ./common1.sh

    elif [ "$1" == "2" ];
    then
        ./common2.sh

    elif [ "${1,,}" == "hacc" ];
    then
        ./company/hacc.sh
        if [ $? -ne 0 ];
        then
            cd /home/user/projects/zzPrivate/commands/git_pull
            ./company/hacc.sh
        fi
    # elif [ "${1,,}" == "hma" ];
    # then
    #     echo ${1,,}

    elif [ "${1,,}" == "hmm" ];
    then
        ./company/hmm.sh
        if [ $? -ne 0 ];
        then
            cd /home/user/projects/zzPrivate/commands/git_pull
            ./company/hmm.sh
        fi

    elif [ "${1,,}" == "kca" ];
    then
        ./company/kca.sh
        if [ $? -ne 0 ];
        then
            cd /home/user/projects/zzPrivate/commands/git_pull
            ./company/kca.sh
        fi

    elif [ "${1,,}" == "kmx" ];
    then
        ./company/kmx.sh
        if [ $? -ne 0 ];
        then
            cd /home/user/projects/zzPrivate/commands/git_pull
            ./company/kmx.sh
        fi
    # elif [ "${1,,}" == "kus" ];
    # then
    #     echo ${1,,}

    else
        echo ${1,,}
    fi
# else
#     if [ "$2" == "1" ];
#     then
#         ./common1.sh
#     elif [ "$2" == "2" ];
#     then
#         ./common2.sh
#     else
#         ./common1.sh
#         ./common2.sh
#     fi
#     if [ $? -ne 0 ];
#     then
#         cd /home/user/projects/zzPrivate/commands/git_pull
#         if [ "$2" == "1" ];
#         then
#             ./common1.sh
#         elif [ "$2" == "2" ];
#         then
#             ./common2.sh
#         else
#             ./common1.sh
#             ./common2.sh
#         fi
#     fi
fi
