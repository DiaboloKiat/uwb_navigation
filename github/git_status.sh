#!/bin/bash

REPO=master_thesis

cd ~/$REPO
git status

############################## submodules ####################################

# ------------- vrx -------------- #
echo "---------------------------------------------------------------------------------------------------"
echo "---------------------------------------- vrx ------------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/vrx
git status
cd ~/$REPO

# ---------- Pozyx_UWB ----------- #
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------- pozyx_uwb --------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/pozyx_uwb
git status
cd ~/$REPO

# ---------- Turtlebot3 ---------- #
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------- turtlebot3 -------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/Turlebot/turtlebot3
git status
cd ~/$REPO

echo "---------------------------------------------------------------------------------------------------"
echo "------------------------------- turtlebot3_simulations --------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/Turlebot/turtlebot3_simulations
git status
cd ~/$REPO

# ------------- ARG -------------- #
echo "---------------------------------------------------------------------------------------------------"
echo "----------------------------------- real_to_sim_env -----------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/ARG/real_to_sim_env
git status
cd ~/$REPO

echo "---------------------------------------------------------------------------------------------------"
echo "------------------------------------- subt-gazebo -------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/ARG/subt-gazebo
git status
cd ~/$REPO

echo "---------------------------------------------------------------------------------------------------"
echo "--------------------------------------- subt_rl ---------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/ARG/subt_rl
git status
cd ~/$REPO

echo "---------------------------------------------------------------------------------------------------"
echo "---------------------------------- robot_localization ---------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$REPO/catkin_ws/src/ARG/robot_localization
git status
cd ~/$REPO