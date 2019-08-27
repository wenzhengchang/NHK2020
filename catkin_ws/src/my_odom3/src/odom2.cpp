#include <ros/ros.h>  // rosで必要はヘッダーファイル
#include <geometry_msgs/Twist.h> // ロボットを動かすために必要
#include <nav_msgs/Odometry.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_datatypes.h>
#include <gazebo_msgs/ModelStates.h> 
#include <sensor_msgs/JointState.h>
#include <iostream>

    double state_odom_x=0.0;//オドメトリX座標[m]
    double state_odom_y=0.0;//オドメトリY座標[m]
    double state_odom_th=0.0; //オドメトリ姿勢[rad]
    double predistance = 0;
    double x = 0;
    double y  = 0;
    double w = 0;
    double r = 0;
    double th = 0;
geometry_msgs::Quaternion odom_quat ;
void twist_Callback(const geometry_msgs::Twist::ConstPtr& twist)
   {
	x = twist->linear.x;
	y = twist->linear.y;
	w = twist->angular.z;
        r = sqrt(x*x+y*y);



   }

void enc_Callback(const sensor_msgs::JointState::ConstPtr& jointstate)
   {

	double kudou1_joint_pos = jointstate->position[0]; // 右車軸の位置[rad]
	double distance = kudou1_joint_pos/(2*M_PI)*0.064;		


     if(w == 0&&r !=0){
     	state_odom_x=state_odom_x+(distance-predistance)/r*x;
     	state_odom_y=state_odom_y+ (distance-predistance)/r*y;
     }
    th =th+ (distance-predistance) * w/0.15;
     odom_quat = tf::createQuaternionMsgFromYaw(th);


	predistance  = distance;

   }





int main(int argc, char **argv){
    ros::init(argc, argv, "listener");
    ros::NodeHandle n;
    tf::TransformBroadcaster odom_broadcaster;
    ros::Time current_time;
    current_time = ros::Time::now();
    ros::Subscriber enc_sub = n.subscribe<sensor_msgs::JointState>("/assemble/joint_states", 1, enc_Callback);
    ros::Subscriber twist_sub = n.subscribe<geometry_msgs::Twist>("/cmd_vel", 1, twist_Callback);
    ros::Publisher odm_pub = n.advertise<geometry_msgs::TransformStamped>("/odometry",1000);
    ros::Rate r(30.0);



    while(n.ok()){

    current_time = ros::Time::now();

    //tf odom->base_link
    geometry_msgs::TransformStamped odom_trans;
    odom_trans.header.stamp = current_time;
    odom_trans.header.frame_id = "odom";
    odom_trans.child_frame_id = "base_link";

    odom_trans.transform.translation.x = state_odom_x;
    odom_trans.transform.translation.y = state_odom_y;
    odom_trans.transform.translation.z = 0.0;

    odom_trans.transform.rotation = odom_quat;
    odom_broadcaster.sendTransform(odom_trans);
    odm_pub.publish(odom_trans);

    ros::spinOnce();
    r.sleep();
    }
}