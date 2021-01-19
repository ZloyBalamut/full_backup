//
// Created by sab3r on 17.08.20.
//

#include "PositionV2.h"


PositionV2::PositionV2(ros::NodeHandle *n)
{
//    subMotor = n->subscribe("motion", 1, &PositionV2::motion, this);
//    subTurner = n->subscribe("turner", 1, &PositionV2::turner, this);
    subEncoder = n->subscribe("encoder_count", 1, &PositionV2::encoderCounter, this);
    pubAngle = n->advertise<std_msgs::Float32>("wheelAngle", 1);
    pubpos = n->advertise<geometry_msgs::Pose>("position", 1);
    pubMotor = n->advertise<std_msgs::Int32>("motion", 1);
    pubTurner = n->advertise<std_msgs::Int32>("turner", 1);
    pubOdom = n->advertise<nav_msgs::Odometry>("odom", 1);
    subFCompas = n->subscribe("Fcompas", 1, &PositionV2::Fcompas, this);
    subCmdVel = n->subscribe("cmd_vel_diff", 1, &PositionV2::cmdvel, this);
    pubCmdVel = n->advertise<geometry_msgs::Twist>("cmd_vel", 1);
    twist.angular.z = 0;
    twist.linear.x = 0;
}

void PositionV2::cmdvel(const geometry_msgs::Twist::ConstPtr &msg)
{
    double r;
    double angle;
    double R;
    double S;

    if (msg->angular.z != 0)
    {
        r = msg->linear.x / msg->angular.z;
        angle = abs(atan(r / BASIC));
        if (msg->angular.z > 0)
            angle = 1.57 - angle;
        else if (msg->angular.z < 0)
            angle = -1.57 + angle;
        R = sqrt(r * r + BASIC * BASIC);
        S = abs(msg->angular.z * R);
        twist.angular.z = (-angle / ANGULARTICK) / 10.f;
        twist.linear.x = (S / 0.471238898038469) * 600.f;
    }
    else
    {
        twist.linear.x = (msg->linear.x / 0.471238898038469) * 600.f;
        twist.angular.z = 0;
    }
    pubCmdVel.publish(twist);
}

void PositionV2::Fcompas(const std_msgs::Float64::ConstPtr &msg)
{
    tf2::Vector3 basic(1, 0, 0);
    tf2::Vector3 basicTop(0, 0, 1);

    Cdir = basic.rotate(basicTop, -(M_PI/180.f) * msg->data);
//    if (abs(tf2::tf2Angle(dir, Cdir)) > 0.02)
//    dir = Cdir;
}


void PositionV2::encoderCounter(const roboteq_motor_controller_driver::channel_values &msg)
{
//    std_msgs::Int32 res;
//    res.data = msg.channel_2;
    turner(msg.channel_2);
    motion(msg.channel_1);
//    pubTurner.publish(res);

//    res.data = msg.channel_1;
//    pubMotor.publish(res);

}

void PositionV2::turner(float msg)
{
    double angle;
    double lenght;
    int res;
    res = msg - enc2;
    enc2 = msg;
    std_msgs::Float32 newMsg;
    tf2::Vector3 direction;
    tf2::Vector3 rot_axis(0, 0, 1);
    wheelAngle = msg * ANGULARTICK;

    if (wheelAngle > 2.15)
        wheelAngle = 2.15;
    else if (wheelAngle < -2.15)
        wheelAngle = -2.15;
    if (prevAngle != wheelAngle)
        center = pos + dir * -BASIC + tf2::tf2Cross(dir ,rot_axis).normalize() * (BASIC / tan(wheelAngle));
    prevAngle = wheelAngle;
//    if (wheelAngle < 0)
//    {
//        angle = M_PI / 2 + wheelAngle;
//        lenght = abs(BASIC / cosf(angle));
//        direction = dir.rotate(rot_axis, M_PI - angle);
//        direction = direction * lenght;
//        center = pos + direction;
//    }
//    else if(wheelAngle > 0)
//    {
//        angle = M_PI / 2 - wheelAngle;
//        lenght = abs(BASIC / cosf(angle));
//        direction = dir.rotate(rot_axis, M_PI + angle);
//        direction = direction * lenght;
//        center = pos + direction;
//    }
    newMsg.data = wheelAngle;
    pubAngle.publish(newMsg);
}

void PositionV2::motion(float msg)
{
    double angle;
    int res;
    res = msg - enc1;
    enc1 = msg;
    tf2::Vector3 basic(1, 0, 0);
    tf2::Vector3 basicTop(0, 0, 1);
    tf2::Vector3 toPos;
    tf2::Vector3 buff;
    geometry_msgs::Pose newMsg;
    if (wheelAngle == 0)
    {
        pos = pos + (dir * TICKLENGHT * res);
    }
    else if (wheelAngle < 0)
    {
        toPos = pos - center;
//        angle = toPos.angle(basic);
//        if ((tf2::tf2Cross(toPos , basic)).z() > 0)
//            angle *= -1;
//        angle = angle - (TICKLENGHT * msg->data / toPos.length());
        toPos = toPos.rotate(basicTop, tf2Scalar(TICKLENGHT * res / (double)toPos.length()));
//        pos.setX(center.x() + toPos.length() * cos(angle));
//        pos.setY(center.y() + toPos.length() * sin(angle));
//        toPos = pos - center;
      dir = toPos.cross(-basicTop).normalized().rotate(basicTop, tf2Scalar(wheelAngle));
//        dir = (dir * toPos.length()).rotate(basicTop, TICKLENGHT * res / toPos.length()).normalize();
        buff = pos;
        pos = center + toPos;
//        std::cout << dir.cross(toPos.normalized().cross(-basicTop)).z() << std::endl;
    }
    else if (wheelAngle > 0)
    {
        toPos = pos - center;
//        angle = toPos.angle(basic);
//        if ((tf2::tf2Cross(toPos , basic)).z() > 0)
//            angle *= -1;
//       angle = angle + (TICKLENGHT * msg->data / toPos.length());

        toPos = toPos.rotate(basicTop, tf2Scalar(-TICKLENGHT * res / (double)toPos.length()));

//        pos.setX(center.x() + toPos.length() * cos(angle));
//        pos.setY(center.y() + toPos.length() * sin(angle));
//        toPos = pos - center;
        dir = toPos.cross(basicTop).normalized().rotate(basicTop, tf2Scalar(wheelAngle));
//        dir = (dir * toPos.length()).rotate(basicTop, -TICKLENGHT * res / toPos.length()).normalize();
        buff = pos;
        pos = center + toPos;

//        std::cout << dir.cross(toPos.normalized().cross(basicTop)).z() << std::endl;
    }
//    std::cout << TICKLENGHT * res - (buff - pos).length() << std::endl;
    std::cout << dir.angle(basic) << std::endl;
    tf2::Quaternion quat;

    tf2::Vector3 rot;
    rot = tf2::tf2Cross(dir , basic);
    if (rot.z() < 0)
    {
        angle = dir.angle(basic);
        quat.setRPY(0, 0, angle);
    }
    else
    {
        angle = dir.angle(basic);
        quat.setRPY(0, 0, -angle);
    }
    newMsg.orientation = tf2::toMsg(quat);
    newMsg.position.x = pos.x();
    newMsg.position.y = pos.y();
    newMsg.position.z = pos.z();
    pubpos.publish(newMsg);
    nav_msgs::Odometry nav;
    nav.pose.pose.orientation = tf2::toMsg(quat);
    nav.pose.pose.position.x = (pos + dir * -BASIC).x();
    nav.pose.pose.position.y = (pos + dir * -BASIC).y();
    nav.pose.pose.position.z = (pos + dir * -BASIC).z();
    nav.header.frame_id = "odom";
    nav.header.stamp = ros::Time::now();
    pubOdom.publish(nav);
    geometry_msgs::TransformStamped transformStamped;

    geometry_msgs::TransformStamped static_transformStamped;
    tf2::Quaternion qu;

//    static_transformStamped.header.stamp = ros::Time::now();
//    static_transformStamped.header.frame_id = "map";
//    static_transformStamped.child_frame_id = "odom";
//    static_transformStamped.transform.translation.x = 0;
//    static_transformStamped.transform.translation.y = 0;
//    static_transformStamped.transform.translation.z = 0;
//    qu.setRPY(0, 0, 0);
//    static_transformStamped.transform.rotation.x = qu.x();
//    static_transformStamped.transform.rotation.y = qu.y();
//    static_transformStamped.transform.rotation.z = qu.z();
//    static_transformStamped.transform.rotation.w = qu.w();
//    br.sendTransform(static_transformStamped);

    transformStamped.header.stamp = ros::Time::now();
    transformStamped.header.frame_id = "odom";
    transformStamped.child_frame_id = "base_footprint";
    transformStamped.transform.translation.x = (pos + dir * -BASIC).x();
    transformStamped.transform.translation.y = (pos + dir * -BASIC).y();
    transformStamped.transform.translation.z = (pos + dir * -BASIC).z();
    tf2::Quaternion q;
    transformStamped.transform.rotation = tf2::toMsg(quat);
//    transformStamped.transform.rotation.x = q.x();
//    transformStamped.transform.rotation.y = q.y();
//    transformStamped.transform.rotation.z = q.z();
//    transformStamped.transform.rotation.w = q.w();

    br.sendTransform(transformStamped);



    static_transformStamped.header.stamp = ros::Time::now();
    static_transformStamped.header.frame_id = "base_footprint";
    static_transformStamped.child_frame_id = "base_link";
    static_transformStamped.transform.translation.x = 0;
    static_transformStamped.transform.translation.y = 0;
    static_transformStamped.transform.translation.z = 0;

    qu.setRPY(0, 0, 0);
    static_transformStamped.transform.rotation.x = qu.x();
    static_transformStamped.transform.rotation.y = qu.y();
    static_transformStamped.transform.rotation.z = qu.z();
    static_transformStamped.transform.rotation.w = qu.w();
    br.sendTransform(static_transformStamped);

    static_transformStamped.header.stamp = ros::Time::now();
    static_transformStamped.header.frame_id = "base_link";
    static_transformStamped.child_frame_id = "camera_link";
    static_transformStamped.transform.translation.x = BASIC;
    static_transformStamped.transform.translation.y = 0;
    static_transformStamped.transform.translation.z = 0.45;
    qu.setRPY(0, 0, 0);
    static_transformStamped.transform.rotation.x = qu.x();
    static_transformStamped.transform.rotation.y = qu.y();
    static_transformStamped.transform.rotation.z = qu.z();
    static_transformStamped.transform.rotation.w = qu.w();
    br.sendTransform(static_transformStamped);

    static_transformStamped.header.stamp = ros::Time::now();
    static_transformStamped.header.frame_id = "base_link";
    static_transformStamped.child_frame_id = "laser";
    static_transformStamped.transform.translation.x = 0.1;
    static_transformStamped.transform.translation.y = 0;
    static_transformStamped.transform.translation.z = 1.03;
    qu.setRPY(0, 0, 0);
    static_transformStamped.transform.rotation.x = qu.x();
    static_transformStamped.transform.rotation.y = qu.y();
    static_transformStamped.transform.rotation.z = qu.z();
    static_transformStamped.transform.rotation.w = qu.w();
    br.sendTransform(static_transformStamped);

}

int main(int ac, char** av)
{
    PositionV2 *pos;
    ros::init(ac, av, "PositionV2");
    ros::NodeHandle n;
    pos = new PositionV2(&n);
    ros::spin();
    return 0;
}