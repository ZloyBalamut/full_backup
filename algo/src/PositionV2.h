//
// Created by sab3r on 17.08.20.
//

#ifndef ALGO_POSITIONV2_H
#define ALGO_POSITIONV2_H

#include "rosdef.h"


class PositionV2 {
public:
    ros::Subscriber subMotor;
    ros::Subscriber subTurner;
    ros::Subscriber subEncoder;
    ros::Subscriber subFCompas;
    ros::Subscriber subCmdVel;



    ros::Publisher pubForce;
    ros::Publisher pubAngle;
    ros::Publisher pubpos;
    ros::Publisher pubdir;
    ros::Publisher pubMotor;
    ros::Publisher pubTurner;
    ros::Publisher pubOdom;
    ros::Publisher pubCmdVel;
//    tf2_ros::TransformBroadcaster map;
//    tf2_ros::TransformBroadcaster odom;
    tf2_ros::TransformBroadcaster br;
//    tf2_ros::TransformBroadcaster base_link;
//    tf2_ros::TransformBroadcaster camera_link;
//    tf2_ros::TransformBroadcaster map;

    geometry_msgs::Twist twist;

    double wheelAngle = 0;
    float enc1 = 0;
    float enc2 = 0;
    double prevAngle = 0;

    ros::Time time = ros::Time::now();

    tf2::Vector3 pos = tf2::Vector3(0, 0, 0);
    tf2::Vector3 center;
    tf2::Vector3 dir = tf2::Vector3(1, 0, 0);
    tf2::Vector3 Cdir = tf2::Vector3(1, 0, 0);

    explicit PositionV2(ros::NodeHandle *n);
    void cmdvel(const geometry_msgs::Twist::ConstPtr &msg);
    void Fcompas(const std_msgs::Float64::ConstPtr &msg);
    void motion(float msg);
    void turner(float msg);
    void encoderCounter(const roboteq_motor_controller_driver::channel_values &msg);
};


#endif //ALGO_POSITIONV2_H
